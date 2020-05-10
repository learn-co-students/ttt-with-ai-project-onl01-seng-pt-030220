class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
    # @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |win_array|
      board.cells[win_array[0]] == board.cells[win_array[1]] &&
      board.cells[win_array[1]] == board.cells[win_array[2]] &&
      # [1, 4, 7] => ["X", "X", "X"] or ["O", "O", "O"]
      (board.cells[win_array[0]] == "X" || board.cells[win_array[0]] == "O")
    end
  end

  def draw?
    board.full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
      # binding.pry
      board.cells[won?.first] if won? # won? => [0, 4, 8]
  end

  def turn
    puts "It's now #{current_player.token}'s turn."
    input = current_player.move(board).to_i
    if board.valid_move?(input)
      board.update(input, current_player)
      board.display
      # system "clear"
    else
      puts "The position is invalid"
      turn
    end
  end

  def play
    # puts "Game #{board.turn_count+1}"
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end
end
