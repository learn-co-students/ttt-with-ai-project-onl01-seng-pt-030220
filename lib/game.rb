class Game
  attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6] ]

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

def current_player
  if @board.turn_count.even? || @board.turn_count == 0
    return @player_1
  else
    return @player_2
  end
end

  def won?
    on = false
    WIN_COMBINATIONS.each do |comb|
      if @board.cells[comb[0]] == "X" && @board.cells[comb[1]] == "X" &&  @board.cells[comb[2]] == "X"
        on = comb
        break
      elsif @board.cells[comb[0]] == "O" && @board.cells[comb[1]] == "O" &&  @board.cells[comb[2]] == "O"
          on = comb
          break
      end
    end
    on
  end

  def draw?
    @board.full? && !won? ? true : false
  end

  def over?
    (won? || draw?) ? true : false
  end

  def winner
    if won?
     @board.cells[won?[0]] # X or O
   end
  end

  def turn
    input = current_player.move(@board)
    if @board.valid_move?(input)
      @board.update(input, current_player)
    else
      puts "Please enter a number 1-9"
      turn
    end
    @board.display
  end

    def play
      turn until over?
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end

end