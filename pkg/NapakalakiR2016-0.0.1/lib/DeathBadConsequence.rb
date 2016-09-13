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
    false
  end
    
  def to_s
    nombre = "Mal royo:\n\tText = " + @text 
    nivel = " \n\tLevels = " + @levels.to_s
    muerte = ""
    if @death
      muerte = " \n\tDeath = true"
    else
      muerte = " \n\tDeath = false"
    end
    nombre + nivel + muerte
  end
  
  def adjustToFitTreasureLists(v, h)
    self
  end
  
end
end
