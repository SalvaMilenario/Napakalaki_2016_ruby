# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class CultistPlayer < Player
  @@totalCultistPlayers=0
  
  def initialize(p,c)
    super(p.name, p.level, p.isDead, p.getVisibleTreasures, p.getHiddenTreasures, p.getPendingBadConsequence)
    @myCultistCard = c
    @@totalCultistPlayers+=1
  end
  
  protected
  def shouldCovert
        false
  end
  
  def getCombatLevel
  
      combatLevelNotCultist = super.getCombatLevel
      combatLevelNotCultist+
        (combatLevelNotCultist*20)/100+
        myCultistCard.getGainedLevels*totalCultisPlayers;
  end
  
  def getOponentLevel(m)
    m.getLevelChangeAgainstCultistPlayer
  end
  
  def giveMeATreasure()
        tVisible = super.visibleTreasures
        i = rad(tVisible.size)
        super.visibleTreasures.remove(i)
  end
    
  def canYouGiveMeATreasure()
    !super.getVisibleTreasures().isEmpty();
  end

end
