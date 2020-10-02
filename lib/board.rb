require 'pry'
class Board
    
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts (" #{cells[0]} | #{cells[1]} | #{cells[2]} ")
    puts ("-----------")
    puts (" #{cells[3]} | #{cells[4]} | #{cells[5]} ")
    puts ("-----------")
    puts (" #{cells[6]} | #{cells[7]} | #{cells[8]} ")
  end

  def position(user_input)
    input = user_input.to_i - 1
    cells[input]
  end

  def full?
    if cells.include?(" ")
      return false
    else
      return true
    end
  end

  def turn_count
    turn_count = 0
      cells.each do |cell|
        if cell == "X" || "O" && cell != " "
          turn_count += 1
      end
    end
    turn_count
  end

  def taken?(cell_index)
    if position(cell_index).include?(" ")
      return false
    else
      return true
    end
  end

  def valid_move?(input)
    if taken?(input) == false && (1..9).include?(input.to_i)
      return true
    else
      return false 
    end 
  end

  def update(move, player)
    move = move.to_i - 1
    cells[move] = player.token
  end 



end