#!/usr/bin/env ruby
# encoding: UTF-8
require_relative 'Treasures.rb'
module NapakalakiGame
class BadConsequence
  
  ########## Constructores ##########
    
  @@MAXTREASURES = 10
  
  def initialize(text, levels, nVisibleTreasures, nHiddenTreasures, specificVisibleTreasures, specificHiddenTreasures, death)
    @text = text
    @levels = levels
    @nVisibleTreasures = nVisibleTreasures
    @nHiddenTreasures = nHiddenTreasures
    @death = death
    @specificVisibleTreasures = specificVisibleTreasures
    @specificHiddenTreasures = specificHiddenTreasures
  end
  
  def self.newNumberOfTreasures(text, levels, nVisible, nHidden) 
    new(text, levels, nVisible, nHidden, Array.new, Array.new, false)
  end
  
  def self.newDeath(text)
    new(text, Player.MAXLEVEL, @@MAXTREASURES, @@MAXTREASURES, Array.new, Array.new, true)
  end
  
  def self.newSpecificTreasures(text, levels, tVisible, tHidden)
    new(text, levels, 0, 0, tVisible, tHidden, false)
  end
  
  private_class_method :new # Efecto Wert, privatiza el método new
  
  ########## Getters ruby ##########
  
  attr_reader :death, :text, :levels, :nVisibleTreasures, :nHiddenTreasures, :specificHiddenTreasures, :specificVisibleTreasures 
  
  def substractVisibleTreasure(t)#Treasure t
    if @nVisibleTreasures==0
      if @specificVisibleTreasures.count(t.type)==1 #Si hay solo uno
        @specificVisibleTreasures.delete(t.type)
      else # si hay más de uno, sólo borramos el primero
        i = @specificVisibleTreasures.find_index(t.type)
        @specificVisibleTreasures.delete_at(i)
      end
    else
      @nVisibleTreasures = (@nVisibleTreasures-1) < 0 ? 0 : @nVisibleTreasures-1 ;
#     Exactamente igual que en java, if else compacto
    end
  end
  
  def substractHiddenTreasure(t)#Treasure t
    if @nHiddenTreasures==0
      if @specificHiddenTreasures.count(t.type)==1 #Si hay solo uno
        @specificHiddenTreasures.delete(t.type)
      else # si hay más de uno, sólo borramos el primero
        i = @specificHiddenTreasures.find_index(t.type)
        @specificHiddenTreasures.delete_at(i)
      end
    else
      @nHiddenTreasures = (@nHiddenTreasures-1) < 0 ? 0 : @nHiddenTreasures-1 ;
#     Exactamente igual que en java, if else compacto
    end
  end
 
  def isEmpty
    return @nVisibleTreasures==0 &&
           @nHiddenTreasures==0 && 
           @specificVisibleTreasures.empty? &&
           @specificHiddenTreasures.empty?
  end

  def adjustToFitTreasureLists(v, h)#v:Treasure[], h:Treasure[]
    if !@specificVisibleTreasures.empty? || !@specificHiddenTreasures.empty?
      newVisibleTreasuresBad = Array.new
      newHiddenTreasuresBad = Array.new
      add=true
      
      v.each do |t|
        if @specificVisibleTreasures.include? t.type
          if @specificVisibleTreasures.count(t.type)==1
            if add
              add = false
              newVisibleTreasuresBad << t.type
            end
          else
            newVisibleTreasuresBad << t.type
          end
        end
      end
      add=true
      
      h.each do |t|
        if @specificHiddenTreasures.include? t.type
          if @specificHiddenTreasures.count(t.type)==1
            if add
              add = false
              newHiddenTreasuresBad << t.type
            end
          else
            newHiddenTreasuresBad << t.type
          end
          
        end
      end
      BadConsequence.newSpecificTreasures(@text, 0, newVisibleTreasuresBad, newHiddenTreasuresBad) #return
    else
#     Número de tesoros visibles a quitar 
      minVisibleTreasures =  @nVisibleTreasures > v.length ? v.length : @nVisibleTreasures
#      Número de tesoros ocultos a quitar
      minHiddenTreasures = @nHiddenTreasures > h.length ? h.length : @nHiddenTreasures
      BadConsequence.newNumberOfTreasures(@text, 0, minVisibleTreasures, minHiddenTreasures) #return
    end
  end
  
  def to_s
    textoInicial = "\n\tTexto = " + @text.to_s + 
         "\n\tLevels = " + @levels.to_s +
         "\n\tNumber of Visible Treasures = " + @nVisibleTreasures.to_s +
         "\n\tNumber of Hidden Treasures = " + @nHiddenTreasures.to_s +
         "\n\tDeath = " + @death.to_s
    textoArrayVisibleTreasures = " \n\tArray Specific Visible Treasures: "
    textoArrayHiddenTreasures = " \n\tArray Specific Hidden Treasures: "
    
    unless @specificVisibleTreasures.empty?  
      @specificVisibleTreasures.each do |tesoro|
        textoArrayVisibleTreasures += (tesoro.to_s + " ")
      end
    else  
      textoArrayVisibleTreasures += "No pierde ningún tesoro específico."
    end
    
    unless @specificHiddenTreasures.empty?
      @specificHiddenTreasures.each do |tesoro|
        textoArrayHiddenTreasures += (tesoro.to_s + " ")
      end
    else
      textoArrayHiddenTreasures += "No pierde ningún tesoro específico."
    end
    
    textoInicial + textoArrayVisibleTreasures + textoArrayHiddenTreasures #return
  end
  
  protected
  def self.MAXTREASURES
      @@MAXTREASURES
  end

end
end