module Players
    class Computer < Player
        def move(board)
            ai_move = (rand(9) + 1).to_s

            !board.taken?(ai_move) ? ai_move : self.move(board)
        end
    end
end