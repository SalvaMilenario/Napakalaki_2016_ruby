#!/usr/bin/env ruby
# encoding: UTF-8
module NapakalakiGame
class Monster
=begin
Constructor que crea y asigna las variables 
de instancia el primer valor sera el nombre 
de monstruo, el segundo será su nivel, el 
tercero el mal rollo, el cuarto el premio 
y el quinto opcional sero el incremento 
o decremento para sectarios
=end
  def initialize(name, level, bc, prize, levelChangeAgainstCultistPlayer=0)
    @name = name
    @combatLevel=level
    @prize = prize
    @bc = bc
    @levelChangeAgainstCultistPlayer=levelChangeAgainstCultistPlayer
  end

#Método to_s devuelve los variables de instacia en un String

  def to_s
    "Nombre: "+@name+"\nNivel: "+@combatLevel.to_s+"\nMal rollo: "+@bc.to_s+"\nPremios: "+@prize.to_s+"\nIncremento para sectarios"+@levelChangeAgainstCultistPlayer.to_s#return
  end

#Métodos para leer valores de variables de instancia 
  attr_reader :name, :combatLevel, :bc, :levelChangeAgainstCultistPlayer
#Para ver los niveles y los tesoros del premio crearemos metodos get  
  def getLevelsGained
    @prize.levels
  end
  
  def getTreasuresGained
    @prize.treasures
  end
  
  def getCombatLevelAgainstCultistPlayer
    @combatLevel+@levelChangeAgainstCultistPlayer
  end
end
end