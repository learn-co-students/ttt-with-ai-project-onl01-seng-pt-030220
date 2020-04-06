module Players
    class Computer < Player
        def move(board)
            # ai_move = (rand(9) + 1).to_s

            # !board.taken?(ai_move) ? ai_move : self.move(board)

            ai_move = (rand(9) + 1).to_s

            if !board.taken?(5)
                ai_move = "5"
            else
                !board.taken?(ai_move) ? ai_move : self.move(board)
            end
            ai_move
        end
    end
end