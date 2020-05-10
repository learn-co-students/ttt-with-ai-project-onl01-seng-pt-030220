module Players
  class Human < Player

    def move(board)
      puts "Please enter your select number"
      gets.strip
    end

  end
end
