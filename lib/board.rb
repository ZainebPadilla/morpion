class Board

  attr_accessor :cases

  def initialize #definition d'un hash
    #le @cases contirn un hash pour l'id et la value définis dans la class boardcase
    @cases = {
      "A1" => BoardCase.new("A1"), "A2" => BoardCase.new("A2"), "A3" => BoardCase.new("A3"),
      "B1" => BoardCase.new("B1"), "B2" => BoardCase.new("B2"), "B3" => BoardCase.new("B3"),
      "C1" => BoardCase.new("C1"), "C2" => BoardCase.new("C2"), "C3" => BoardCase.new("C3")
    }
  end

  def show_board
    puts "   A   B   C"
    puts "1  #{@cases["A1"].game_value} | #{@cases["B1"].game_value} | #{@cases["C1"].game_value}"
    puts "  -----------"
    puts "2  #{@cases["A2"].game_value} | #{@cases["B2"].game_value} | #{@cases["C2"].game_value}"
    puts "  -----------"
    puts "3  #{@cases["A3"].game_value} | #{@cases["B3"].game_value} | #{@cases["C3"].game_value}"
  end


  def play_turn
    #TO DO : une méthode qui :
    #1) demande au bon joueur ce qu'il souhaite faire
    puts "Que souhaite-tu jouer ?"
    gets.chomp.upcase
    #2) change la BoardCase jouée en fonction de la valeur du joueur (X ou O)
    @cases[position].game_value = symbol if @cases[position].game_value == " "
  end

  def victory?
    #TO DO : une méthode qui vérifie le plateau et indique s'il y a un vainqueur ou match nul
    winning_combo = [
      ["A1", "A2", "A3"], ["B1", "B2", "B3"], ["C1", "C2", "C3"], 
      ["A1", "B1", "C1"], ["A2", "B2", "C2"], ["A3", "B3", "C3"], 
      ["A1", "B2", "C3"], ["A3", "B2", "C1"]                      
    ]

     #compare les valeurs (game_value) des trois cases de la combinaison. 
     #Si la valeur de la première case = la deuxième case
     #si la deuxième case = à troisième case
      winning_combo.each do |combo|
        if @cases[combo[0]].game_value == @cases[combo[1]].game_value  && @cases[combo[1]].game_value == @cases[combo[2]].game_value && @cases[combo[0]].game_value != " "
          return true
        end
      end
      return false
  end

  # mise à jour des cases si la case est vide
  def update_case(position, symbol)
    if @cases[position].game_value == " "  # Vérification que la case est vide
      @cases[position].game_value = symbol  # Maj case avec x ou o
    end
  end
end

