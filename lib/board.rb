require "pry"
class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    puts "-----------"
  end

  def position(input)
    cells[input.to_i - 1]
  end

  def full?
    cells.all? do |char|
      if char == "X" || char == "O"
        true
      else
        false
      end
    end
  end

  def turn_count
    cells.count{|char| char == "X" || char == "O"}
  end

  def taken?(input)
    # binding.pry
    position(input) == "X" || position(input) == "O"
    # !(position(input) == " " || position(input) == "")
  end

  def valid_move?(input)
    # binding.pry
    (1..9).include?(input.to_i) && !taken?(input)
    # input.to_i.between?(1, 9) && !taken?(input)
  end

  def update(input, player)
    cells[input.to_i - 1] = player.token # stands for either X or O
  end

end
