module Players
  class Human < Player
    
    def move(board)
      puts "Enter 1-9 to make a move."
      move = gets.strip
      return move
    end

  end
end
