# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'BadConsequence.rb'

module NapakalakiGame

class NumericBadConsequence < BadConsequence
  def initialize(text, levels, nVisibles, nHidden, death=false)
    super(text, levels, death)
    @nVisibleTreasures=nVisibles
    @nHiddenTreasures=nHidden
  end
  
  def substractHiddenTreasure(t)#Treasure t
      @nHiddenTreasures = (@nHiddenTreasures-1) < 0 ? 0 : @nHiddenTreasures-1 #Exactamente igual que en java, if else compacto
  end
  
  def substractHiddenTreasure(t)
    @nHiddenTreasures = (@nHiddenTreasures-1) < 0 ? 0 : @nHiddenTreasures-1
  end
  
  def adjustToFitTreasureLists(v, h)
    #Número de tesoros visibles a quitar
    minVisibleTreasures = v.count
    minHiddenTreasures = h.count
    if (@nVisibleTreasures < minVisibleTreasures)
        minVisibleTreasures=@nVisibleTreasures
    end
    if (@nHiddenTreasures < minHiddenTreasures)
      minHiddenTreasures = @nHiddenTreasures
    end
    NumericBadConsequence.new(text, 0, minVisibleTreasures, minHiddenTreasures)
  end
  
  def isEmpty
    levels==0 && nVisibleTreasures==0 && nHiddenTreasures==0
  end
  
  def to_s
    "Mal royo:\n\tText = " + text +
      " \n\tLevels = " + levels.to_s +
      " \n\tNumber of Visible Treasures = " + nVisibleTreasures.to_s +
      " \n\tNumber of Hidden Treasures = " + nHiddenTreasures.to_s
  end
  
  attr_reader :nHiddenTreasures, :nVisibleTreasures
  
  public_class_method :new #el metodo new tenemos que volver a dejarlo publico
  
end
end