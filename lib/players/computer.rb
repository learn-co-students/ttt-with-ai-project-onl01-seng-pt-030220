module Players
  class Computer < Player
    BEST_MOVE = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]
    CONERS = [0, 2, 6, 8]

    def find_best_move
    end

    def move(board)
      valid_moves = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
      computer_move = valid_moves.sample
      # computer_move = (1..9).to_a.sample #==[1, 2, 3, 4, 5, 6, 7, 8, 9].sample

    end

  end
end
