#!/usr/bin/env ruby
# encoding: UTF-8

require_relative 'TreasureKind.rb'
require_relative 'Prize.rb'
require_relative 'Monster.rb'
require_relative 'NumericBadConsequence.rb'
require_relative 'DeathBadConsequence.rb'
require_relative 'SpecificBadConsequence.rb'
require_relative 'CardDealer.rb'
require_relative 'Dice.rb'

module NapakalakiGame

class Player

  @@MAXLEVEL=10

  attr_reader :dead, :level, :visibleTreasures, :hiddenTreasures, :name
  attr_accessor :canISteal, :enemy, :pendingBadConsequence
  
  def initialize(name, l=1, d=true, v =Array.new, h=Array.new, p=NumericBadConsequence.new("name",0,0,0))
      @level = l
      @name = name
      @dead = d
      @visibleTreasures = v
      @hiddenTreasures = h
      @pendingBadConsequence = p
      @dealer = CardDealer.instance
    end
  
  private ########################### Zona privada #############################
  
  def bringToLive 
    @dead = false
  end
  
  def incrementLevels(l)
    @level+=l    
  end
  
  def decrementLevels(l)
    if @level-l < 1
      @level=1
    else
      @level -= l
    end
  end

  def dieIfNoTreasures
    if @visibleTreasures.empty? && @hiddenTreasures.empty?
      @dead=true
    end
  end
    
  def applyPrize(m)
    p=m.getLevelsGained
    incrementLevels(p)
    p=m.getTreasuresGained
    for i in 1..p
      @hiddenTreasures << CardDealer.instance.nextTreasure
    end
  end
  
  def applyBadConsequence(m)
    b=m.bc
    decrementLevels(b.levels)
    @dead = b.death
    @pendingBadConsequence = b.adjustToFitTreasureLists(@visibleTreasures, @hiddenTreasures)
  end
  
  def canMakeTreasureVisible(t)
    canI=true
    i = t.type
    if i==TreasureKind::ONEHAND || i==TreasureKind::BOTHHANDS
      contDos = howManyVisibleTreasures(TreasureKind::BOTHHANDS)
      contOne = howManyVisibleTreasures(TreasureKind::ONEHAND)
      if (contOne >0 && i==TreasureKind::BOTHHANDS)||contDos>0
        canI=false
      end
      if contOne ==2
        canI=false
      end
    else
      if howManyVisibleTreasures(i)==1
        canI=false
      end
    end
    canI
  end
  
  def howManyVisibleTreasures(tKind)
    cont=0
    @visibleTreasures.each do |t|
      if t.type==tKind
        cont += 1
      end 
    end
    cont #return
  end
  
  def giveMeATreasure
    @hiddenTreasures.delete_at(rand(@hiddenTreasures.size))
  end
  
  def getCombatLevel
    combatLevel = @level 
    @visibleTreasures.each do |t|   
      combatLevel += t.bonus
    end
    combatLevel # return
  end
  
  def canYouGiveMeATreasure
    !(@enemy.hiddenTreasures.empty?)
  end
  protected ########################### Zona protected #############################
  
  def getOponentLevel(m)
    m.combatLevel
  end
  
  def shouldConvert
    Dice.instance.nextNumber==1
  end
  
  public ########################### Zona pública #############################
  
  def getHiddenTreasures
    @hiddenTreasures
  end

  def getVisibleTreasures
    @visibleTreasures
  end
  
  def combat(m)
    myLevel = getCombatLevel
    monsterLevel = getOponentLevel(m)
    if myLevel > monsterLevel
      applyPrize(m)
      if level >= @@MAXLEVEL
          retur = CombatResult::WINGAME
      else
          retur = CombatResult::WIN
      end
    else
      if shouldConvert
        retur = CombatResult::LOSEANDCONVERT
      else
        applyBadConsequence(m)
        retur = CombatResult::LOSE
      end
    end
    retur
  end
  
  def makeTreasureVisible(t)
    canI = canMakeTreasureVisible(t)
    if canI
      @visibleTreasures << t
      @hiddenTreasures.delete(t)
    end
  end
  
  def discardVisibleTreasure(t)
    @visibleTreasures.delete(t)
    if (@pendingBadConsequence!=nil) && (!@pendingBadConsequence.isEmpty)
      @pendingBadConsequence.substractVisibleTreasure(t)
    end
    dieIfNoTreasures
  end
  
  def discardHiddenTreasure(t)
    @hiddenTreasures.delete(t)
    if (@pendingBadConsequence!=nil) && (!@pendingBadConsequence.isEmpty)
      @pendingBadConsequence.substractHiddenTreasure(t)
    end
    dieIfNoTreasures
  end
  
  def validState
    (@pendingBadConsequence.isEmpty) && (@hiddenTreasures.size<=4)||(@dead&&(@hiddenTreasures.empty? &&@visibleTreasures.empty?))
  end
  
  def initTreasures
    bringToLive
    tirada = Dice.instance.nextNumber
    numeroTesoros = 2
    numeroTesoros = 3 if tirada==6
    numeroTesoros = 1 if tirada == 1
    for i in 1..numeroTesoros do
      @hiddenTreasures << CardDealer.instance.nextTreasure
    end
  end
  
  def stealTreasure
    if @canISteal
      if canYouGiveMeATreasure
        t = giveMeATreasure
        @canISteal=false
        @hiddenTreasures << t
      end
    end
    
  end
  
  def discardAllTreasures
    ocultos = Array.new
    ocultos.replace(@hiddenTreasures)
    visibles = Array.new
    visibles.replace(@visibleTreasures)
    ocultos.each do |t|
      discardHiddenTreasure(t)
    end
    visibles.each do |t|
      discardVisibleTreasure(t)
    end
  end
  
  def to_s #level.to_s no necesita el 10, por defecto se elige la base 10
    text = "\n\tName = " + @name.to_s+
          "\n\tLevel = " + @level.to_s + 
          "\n\tPendingBadConsequence: { " + @pendingBadConsequence.to_s + "\n\t} "+
          "\n\tDead = " + @dead.to_s
    textoHiddenTreasures = " \n\tArray Hidden Treasures: { "
    textoVisibleTreasures = " \n\tArray Visible Treasures: { "
    unless @visibleTreasures.empty?
      @visibleTreasures.each do |t|
        textoVisibleTreasures += t.to_s + " "
      end 
    else
      textoVisibleTreasures += "No tiene ningún tesoro visible. "
    end
    
    unless @hiddenTreasures.empty?
      @hiddenTreasures.each do |t|
        textoHiddenTreasures += t.to_s + " "
      end 
    else
      textoHiddenTreasures += "No tiene ningún tesoro oculto. "
    end
    text += textoHiddenTreasures + "}" + textoVisibleTreasures + "}" #return
  end 
  
  def self.MAXLEVEL
    @@MAXLEVEL
  end
  
end

end
