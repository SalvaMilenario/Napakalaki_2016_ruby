#!/usr/bin/env ruby
# encoding: UTF-8
require_relative 'TreasureKind.rb'
module NapakalakiGame
class Treasure
  
  attr_reader :name, :bonus, :type
  
  def initialize(n, bon, t)
    @name=n
    @bonus=bon
    @type=t
  end
  def to_s
    "\n\tTesoro: " + @name + 
    "\n\t\tBonus: " + @bonus.to_s +
    "\n\t\tTreasureKind: " + @type.to_s
  end
end

end