#!/usr/bin/env ruby
# encoding: UTF-8

require_relative 'Treasures.rb'
require_relative 'Monster.rb'
require_relative 'BadConsequence.rb'
require_relative 'Prize.rb'
require 'singleton'

module NapakalakiGame
class CardDealer
  include Singleton #Alé y a pastá
  
  def initTreasureCardDeck
    @usedTreasures = Array.new
    @unusedTreasures = Array.new
    @unusedTreasures << Treasure.new("¡Sí mi amo!", 4, TreasureKind::HELMET)
    @unusedTreasures << Treasure.new("Botas de investigación",3, TreasureKind::SHOE)
    @unusedTreasures << Treasure.new("Capucha de Cthulhu", 3, TreasureKind::HELMET)
    @unusedTreasures << Treasure.new("A prueba de babas", 2, TreasureKind::ARMOR)
    @unusedTreasures << Treasure.new("Botas de lluvia ácida", 1, TreasureKind::BOTHHANDS)
    @unusedTreasures << Treasure.new("Casco minero", 2, TreasureKind::HELMET)
    @unusedTreasures << Treasure.new("Ametralladora Thompson", 4, TreasureKind::BOTHHANDS)
    @unusedTreasures << Treasure.new("Camiseta de la UGR", 1, TreasureKind::ARMOR)
    @unusedTreasures << Treasure.new("Clavo de rail ferroviario", 3, TreasureKind::ONEHAND)
    @unusedTreasures << Treasure.new("Cuchillo de sushi arcano", 2, TreasureKind::ONEHAND)
    @unusedTreasures << Treasure.new("Fez alópodo", 3, TreasureKind::HELMET)
    @unusedTreasures << Treasure.new("Hacha prehistórica", 2, TreasureKind::ONEHAND)
    @unusedTreasures << Treasure.new("El aparato del Pr. Tesla", 4, TreasureKind::ARMOR)
    @unusedTreasures << Treasure.new("Gaita", 4, TreasureKind::BOTHHANDS)
    @unusedTreasures << Treasure.new("Insecticida", 2, TreasureKind::ONEHAND)
    @unusedTreasures << Treasure.new("Escopeta de 3 cañones", 4, TreasureKind::BOTHHANDS)
    @unusedTreasures << Treasure.new("Garabato místico", 2, TreasureKind::ONEHAND)
    @unusedTreasures << Treasure.new("La rebeca metálica", 2, TreasureKind::ARMOR)
    @unusedTreasures << Treasure.new("Mazo de los antiguos", 3, TreasureKind::ONEHAND)
    @unusedTreasures << Treasure.new("Necro-playboycon", 3, TreasureKind::ONEHAND)
    @unusedTreasures << Treasure.new("Lanzallamas", 4, TreasureKind::BOTHHANDS)
    @unusedTreasures << Treasure.new("Necro-comicón", 1, TreasureKind::ONEHAND)
    @unusedTreasures << Treasure.new("Necronomicón", 5, TreasureKind::BOTHHANDS)
    @unusedTreasures << Treasure.new("Linterna a 2 manos", 3, TreasureKind::BOTHHANDS)
    @unusedTreasures << Treasure.new("Necro-gnomicón", 2, TreasureKind::ONEHAND)
    @unusedTreasures << Treasure.new("Necrotelecom", 2, TreasureKind::HELMET)
    @unusedTreasures << Treasure.new("Mazo de los antiguos", 3,TreasureKind::ONEHAND)
    @unusedTreasures << Treasure.new("Necroplayboycón",3,TreasureKind::ONEHAND)
    @unusedTreasures << Treasure.new("Porra preternatural", 2, TreasureKind::ONEHAND)
    @unusedTreasures << Treasure.new("Tentácula de pega", 2, TreasureKind::HELMET)
    @unusedTreasures << Treasure.new("Zapato deja-amigos", 1, TreasureKind::SHOE)
    @unusedTreasures << Treasure.new("Shogulador", 1, TreasureKind::BOTHHANDS)
    @unusedTreasures << Treasure.new("Varita de atizamiento", 3, TreasureKind::ONEHAND)
  end

  def initMonsterCardDeck
    @usedMonsters = Array.new
    @unusedMonsters = Array.new
    # 3 Byakhees de bonanza
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.newSpecificTreasures("Pierdes tu armadura visible y" +
                                        "otra oculta",0,
                                        [TreasureKind::ARMOR], 
                                        [TreasureKind::ARMOR])
    prize = Prize.new(2, 1)
    # Añade un nuevo monstruo al final del array
    @unusedMonsters << Monster.new("3 Byakhees de bonanza", 8, badConsequence, prize)
  
  
    # Chibithulhu
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.newSpecificTreasures("Embobados con el lindo" +
                                                        "primigenio te descartas de tu casco" +
                                                        "visible",0, 
                                                        [TreasureKind::HELMET], 
                                                        Array.new)
    prize = Prize.new(1, 1)
    # Añade un nuevo monstruo al final del array
    @unusedMonsters << Monster.new("Chibithulhu", 2, badConsequence, prize)
  
  
    # El sopor de Dunwich
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.newSpecificTreasures("El primordial bostezo contaguioso." +
                                                        "Pierdes el calzado visible",0, 
                                                        [TreasureKind::SHOE], 
                                                        Array.new)
    prize = Prize.new(1,1)
    # Añade un nuevo monstruo al final del array
    @unusedMonsters << Monster.new("El sopor de Dunwich", 2, badConsequence, prize)
  
    
    # Ángeles de la noche ibicenca
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.newSpecificTreasures("Te atrapan para llevarte de fiesta" +
                                                        "\n\ty te dejan car en mitad del vuelo." +
                                                        "\n\tDescarta 1 mano visible y 1 mano oculta",0,
                                                        [TreasureKind::ONEHAND], 
                                                        [TreasureKind::ONEHAND])
    prize = Prize.new(4,1)
    # Añade un nuevo monstruo al final del array
    @unusedMonsters << Monster.new("Ángeles de la noche ibicenca", 14, badConsequence, prize)
  
    
    # El gorrón en el umbral
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.newNumberOfTreasures("Pierdes todos tus tesoros visibles.", 
                                                        0, BadConsequence.MAXTREASURES, 0)
    prize = Prize.new(3,1)
    # Añade un nuevo monstruo al final del array
    @unusedMonsters << Monster.new("El gorrón en el umbral", 10, badConsequence, prize)
  
    
    # H.P. Munchcraft
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.newSpecificTreasures("Pierdes la armadura visible.",
                                                        0, [TreasureKind::ARMOR], 
                                                        Array.new)
    prize = Prize.new(2,1)
    # Añade un nuevo monstruo al final del array
    @unusedMonsters << Monster.new("H.P. Munchcraft", 6, badConsequence, prize)
  
    
    # Bichgooth
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.newSpecificTreasures("Sientes bichos bajo la ropa." +
                                                        "\n\tDescarta la armadura visible",0,
                                                        [TreasureKind::ARMOR], 
                                                        Array.new)
    prize = Prize.new(1,1)
    # Añade un nuevo monstruo al final del array
    @unusedMonsters << Monster.new("Bichgooth", 2, badConsequence, prize)
  
    
    # El rey de rosa
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.newNumberOfTreasures("Pierdes 5 niveles y 3 tesoros visibles",
                                                        5, 3, 0)
    prize = Prize.new(4,2)
    # Añade un nuevo monstruo al final del array
    @unusedMonsters << Monster.new("El rey de rosa", 13, badConsequence, prize)
  
    
    # La que redacta en las tinieblas
    # El primer array de badConsequence es specificVisibleTreasures, 
    # el segundo specificHiddenTreasures
    # Análogamente si no es array es nVisibleTreasures y nHiddenTreasures
    badConsequence = BadConsequence.newNumberOfTreasures("Toses los pulmones y"+
                                                        "\n\tpierdes 2 niveles",
                                                        2, 0, 0)
    prize = Prize.new(1,1)
    # Añade un nuevo monstruo al final del array
    @unusedMonsters << Monster.new("La que redacta en las tinieblas\n", 2, 
                              badConsequence, prize)
  
  
    #Los hondos
    badConsequence = BadConsequence.newDeath("Estos resultan "+
                                            "\n\tbastante superficiales y te aburren "+
                                            "\n\tmortalmente. Estas muerto")
    prize = Prize.new(2,1)
    
    @unusedMonsters << Monster.new("Los hondos", 8 ,badConsequence,prize)
    
    #Semillas Cthulhu
    badConsequence = BadConsequence.newNumberOfTreasures("Pierdes 2 niveles y 2 "+
                                                        "\n\ttesoros ocultos", 2, 0, 2)
    prize = Prize.new(2,1)
    # Añade un nuevo monstruo al final del array
    @unusedMonsters << Monster.new("Semillas Cthulhu", 4, badConsequence, prize)
   
   #Dameargo
   badConsequence = BadConsequence.newSpecificTreasures("Te intentas escaquear."+
                                                        "\n\tPierdes una mano visible",0,
                                                        [TreasureKind::ONEHAND],
                                                        Array.new)
   prize = Prize.new(2,1)
   # Añade un nuevo monstruo al final del array
   @unusedMonsters << Monster.new("Dameargo", 1, badConsequence, prize)

    #Pollipólipo volante
    badConsequence = BadConsequence.newNumberOfTreasures("Da mucho asquito."+
                                                        "\n\tPierdes 3 niveles", 
                                                        3, 0, 0)
    prize = Prize.new(1,1)
    # Añade un nuevo monstruo al final del array
    @unusedMonsters << Monster.new("Pollipólipo volante", 3, badConsequence, prize)
    
    #Yskhtihyssq-Goth
    badConsequence = BadConsequence.newDeath("No le hace gracia que"+
                                            "\n\tpronuncien mal su nombre. Estas"+
                                            "\n\tmuerto")
    prize = Prize.new(3,1)
    # Añade un nuevo monstruo al final del array
    @unusedMonsters << Monster.new("Yskhtihyssq-Goth", 12, badConsequence, prize)
    
    
    #Familia feliz
    badConsequence = BadConsequence.newDeath("La familia te atrapa."+
                                            "\n\tEstas muerto")
    prize = Prize.new(4,1)
    # Añade un nuevo monstruo al final del array
    @unusedMonsters << Monster.new("Familia feliz", 1, badConsequence, prize)
    
    #Roboggoth
    badConsequence = BadConsequence.newSpecificTreasures("La quinta directiva " +
                                                         "\n\tprimaria te obliga a perder 2 niveles y" +
                                                         "\n\tun tesoro 2 manos visible.",2,
                                                         [TreasureKind::BOTHHANDS],
                                                         Array.new)
    prize = Prize.new(2, 1)
    # Añade un nuevo monstruo al final del array
    @unusedMonsters << Monster.new("Roboggoth", 8, badConsequence, prize)
    
    #El espia
    badConsequence = BadConsequence.newSpecificTreasures("Te asusta en la noche." +
                                                      "\n\tPierdes un casco visible.",0,
                                                      [TreasureKind::HELMET], Array.new)
    prize = Prize.new(1, 1)
    @unusedMonsters << Monster.new("El espia", 5, badConsequence, prize)
  
    #El lenguas
    badConsequence = BadConsequence.newNumberOfTreasures("Menudo susto te llevas."+
                                                         "\n\tPierdes 2 niveles y 5 tesoros visibles.",
                                                         2,5,0)
    prize = Prize.new(1, 1)
    @unusedMonsters << Monster.new("El lenguas", 20, badConsequence, prize)
  
    #Bicéfalo
    badConsequence = BadConsequence.newSpecificTreasures("Te faltan manos para" +
                                                         "\n\ttanta cabeza. Pierdes 3 niveles y tus" +
                                                         "\n\ttesoros visibles de las manos.",
                                                         3,[TreasureKind::ONEHAND,TreasureKind::ONEHAND,TreasureKind::BOTHHANDS],
                                                         Array.new)
    prize = Prize.new(1, 1)
    @unusedMonsters << Monster.new("Bicéfalo", 20, badConsequence, prize)

  end
  
  def shuffleTreasures
    @unusedTreasures.shuffle!
  
  end

  def shuffleMonsters
    @unusedMonsters.shuffle!
  end
  
  private :shuffleMonsters, :shuffleTreasures, :initMonsterCardDeck, :initTreasureCardDeck
  
  def nextTreasure()
    if @unusedTreasures.empty?
      @usedTreasures.shuffle!
      @unusedTreasures = @usedTreasures.clone
      @usedTreasures.clear
    end
      treasure = @unusedTreasures.pop
      @usedTreasures << treasure
      treasure #return
  end
  
  def nextMonster()
    if @unusedMonsters.empty?
      @usedMonsters.shuffle!
      @unusedMonsters = @usedMonsters.clone #Funciona porque copia la referencias de un nivel
      @usedMonsters.clear
    end
    monster = @unusedMonsters.pop
    @usedMonsters << monster
    monster #return
  end
  
  def initCards
    initMonsterCardDeck
    initTreasureCardDeck
    shuffleMonsters
    shuffleTreasures
  end
  
  def giveTreasureBack(t)
    @usedTreasures << t
    @unusedTreasures.delete(t)
  end
  
  def giveMonsterBack(m)
    @usedMonsters << m
    @unusedMonsters.delete(m)
  end
  
end

end