# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'BadConsequence.rb'
require_relative 'NumericBadConsequence.rb'

module NapakalakiGame
  

class DeathBadConsequence < NumericBadConsequence
  def initialize(name)
    super(name,0,0,0,true)
  end
  
  def substractVisibleTreasure(t)
    
  end
  
  def substractHiddenTreasure(t)
    
  end
  
  def isEmpty
    !super.death
  end
    
  def to_s
    "Mal royo:\n\tText = " + super.text + 
      " \n\tLevels = " + super.levels.to_s + 
      " \n\tDeath = " + super.death
  end
  
  def adjustToFitTreasureLists(v, h)
    this
  end
  
end
end
