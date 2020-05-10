module Players
  class Computer < Player

    # def move(board)
    #   computer_move = (1..9).to_a.sample #==[1, 2, 3, 4, 5, 6, 7, 8, 9].sample
    #   if board.valid_move?(computer_move)
    #     board.update(computer_move, self)
    #   else
    #     move(board)
    #   end
    # end

    def move(board)
      puts "Please enter your select number"
      gets.strip
    end

  end
end
