require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/board'
require_relative 'lib/boardcase'

#lancement du jeu :
puts '--------------------------------------------------'
puts "|Bienvenue sur le jeu du morpion!                |"
puts "|L'objectif est de faire une ligne ou diagonale !|"
puts '--------------------------------------------------'
#création des joueurs
player1 = Player.new("José", "x")
player2 = Player.new("Josiane", "o")
puts "\n "
#afficher les joueurs
puts " Joueur1 : #{player1.name} avec le symbol : #{player1.symbol}"
puts " Joueur2 : #{player2.name} avec le symbol : #{player2.symbol}"
puts "\n "


#création du tableau
puts "Voici le plateau de jeu :"
puts "\n "
board = Board.new
board.show_board
puts "\n "


# Initialiser le joueur courant
current_player = player1


# Boucle principale du jeu
loop do
  # Demander au joueur actuel de choisir une case
  puts "#{current_player.name}, à toi de jouer. Entre une position (ex: A1, B2, etc.) :"
  move = gets.chomp.upcase

  # Valider et jouer le coup
  if board.cases.key?(move) && board.cases[move].game_value == " "
    board.update_case(move, current_player.symbol)
  else
    puts "Mouvement invalide, essaie encore."
    next
  end

   # Vérifier si le joueur a gagné après ce coup
   if board.victory?
    board.show_board
    puts "#{current_player.name} a gagné !"
    break  # Fin du jeu, un joueur a gagné
  end

    # Changer de joueur
    current_player = (current_player == player1) ? player2 : player1
    board.show_board
end