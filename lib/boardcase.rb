class BoardCase
 attr_accessor :board_id, :game_value

  
  def initialize(board_id)
    @board_id = board_id
    @game_value = " " # La case est vide au début
  end
  
end