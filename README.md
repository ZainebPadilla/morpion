# Morpion

Le travail consiste à structurer un jeu du morpion en Ruby à l'aide de plusieurs classes. 
- classe BoardCase représente chaque case du plateau avec une position et une valeur ("X", "O", ou vide).
- classe Board gère l'affichage du plateau, la mise à jour des cases, et la vérification des conditions de victoire ou de match nul.
- classe Player représente un joueur avec un nom et un symbole ("X" ou "O"). 
- classe Game orchestre le déroulement de la partie, alternant les tours entre les joueurs, vérifiant les mouvements et déclarant un gagnant ou une égalité à la fin
