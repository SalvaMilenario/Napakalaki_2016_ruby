#!/usr/bin/env ruby
# encoding: UTF-8
require_relative 'Treasures.rb'

module NapakalakiGame
class BadConsequence
  
@@MAXTREASURES = 10

  def initialize (text, levels, death)
    @text = text
    @levels = levels
    @death=death
  end
  
  private_class_method :new # Efecto Wert, privatiza el método new
  public
  attr_reader :text, :levels, :death
  
  def isEmpty
    raise NotImplementedError.new
  end
    
  def substractVisibleTreasure(t)
    raise NotImplementedError.new
  end
    
  def substractHiddenTreasure(t)
    raise NotImplementedError.new
  end
    
  def adjustToFitTreasureLists(v, h)
    raise NotImplementedError.new
  end
    
  def to_s
    raise NotImplementedError.new
  end
  
  protected
  def self.MAXTREASURES
      @@MAXTREASURES
  end

end
end
