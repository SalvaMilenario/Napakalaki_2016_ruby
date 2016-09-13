# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'Player.rb'

module NapakalakiGame
  
class CultistPlayer < Player
  @@totalCultistPlayers=0
  
  def initialize(p,c)
    super(p.name, p.level, p.dead, p.visibleTreasures, p.hiddenTreasures, p.pendingBadConsequence)
    @myCultistCard = c
    @@totalCultistPlayers+=1
  end
  
  protected
  def shouldCovert
    false
  end
  
  def getCombatLevel
    combatLevelNotCultist = super.getCombatLevel
    (combatLevelNotCultist+(combatLevelNotCultist*20)/100+myCultistCard.getGainedLevels*totalCultisPlayers).to_int
  end
  
  def getOponentLevel(m)
    m.getLevelChangeAgainstCultistPlayer
  end
  
  def giveMeATreasure
    super.visibleTreasures.delete_at(rad(super.visibleTreasures.size))
  end
    
  def canYouGiveMeATreasure
    !super.getVisibleTreasures.isEmpty
  end
  public
  def to_s
    "Sectario:\n"+super.to_s
  end

#  p= Player.new("Salva")
#  cu=Cultist.new("jhfjhv",1)
#  c= CultistPlayer.new(p,cu)
#  puts c
  
end
end