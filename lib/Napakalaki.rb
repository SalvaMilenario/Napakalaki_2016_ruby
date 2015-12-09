#!/usr/bin/env ruby
# encoding: UTF-8

require_relative 'Treasures.rb'
require_relative 'Monster.rb'
require_relative 'Player.rb'
require_relative 'BadConsequence.rb'
require_relative 'Prize.rb'
require_relative 'Dice.rb' 
require_relative 'CombatResult.rb'
require 'singleton'

module NapakalakiGame
class Napakalaki
  include Singleton
  @@firstTurn=true
  
  def initPlayers(names)
    @players = Array.new
    names.each do |n|
      @players.push(Player.new(n));
    end
  end
  
  def setEnemies
    @players.each do |p|
      repite=true
      i=@players.index(p)
      begin
        idp =Dice.instance.nextNumber% @players.length
        if i!=idp
          p.enemy=@players.at(idp)
          repite=false
        end
      end while repite
    end
  end
  
  def getCurrentPlayer
    @currentPlayer
  end
  
  def getCurrentMonster
    @currentMonster
  end

  def nextPlayer
    if @@firstTurn
      @@firstTurn=false;
      @currentPlayerIndex = Dice.instance.nextNumber % @players.size
    else
      @currentPlayerIndex += 1
      @currentPlayerIndex %= @players.size
    end
    @players.at(@currentPlayerIndex)
  end
  
  def developCombat 
    result = @currentPlayer.combat(@currentMonster)
    @dealer.giveMonsterBack(@currentMonster)
    result
  end
  
  def discardVisibleTreasures(t)#Array Treasure
    t.each do |tes|
      @currentPlayer.discardVisibleTreasure(tes)
      @dealer.giveTreasureBack(tes)
    end
  end
  
  def discardHiddenTreasures(t)#Array Treasure
    t.each do |tes|
      @currentPlayer.discardHiddenTreasure(tes)
      @dealer.giveTreasureBack(tes)
    end
  end
  
  def makeTreasureVisible(t)#Array Treasure
    t.each do |i|
      @currentPlayer.makeTreasureVisible(i)
    end
  end
  
  def initGame(players)#Array
    initPlayers(players)
    setEnemies
    @dealer = CardDealer.instance
    @dealer.initCards
    nextTurn
  end

  def nextTurn
    stateOk = nextTurnIsAllowed
    if stateOk
      @currentPlayer = nextPlayer
      @currentMonster = @dealer.nextMonster
      if @currentPlayer.dead
        @currentPlayer.initTreasures
      end
    end
    stateOk #return
  end
  
  def nextTurnIsAllowed
    @currentPlayer==nil ? true : @currentPlayer.validState #return
  end
  
  def endOfGame(result)#CombatResult
    result==CombatResult::WINGAME #return
  end
  
  private :initPlayers, :nextPlayer, :setEnemies, :nextTurnIsAllowed
end
end