class Board
  attr_accessor :cells

  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(num)
    num = num.to_i - 1
    @cells[num]
  end

  def full?
     @cells.include?(" ") ? false : true
  end

  def turn_count
    getcount = 0
    @cells.each do |pos|
      if pos == 'X' || pos == 'O'
        getcount += 1
      end
    end
    getcount
  end

  def taken?(num)
     position(num) == " " ? false : true
  end

  def valid_move?(num)
    num = num.to_i
    !(taken?(num)) && num.between?(1,9)
  end

  def update(num, player)
    num = num.to_i - 1
    @cells[num] = player.token
  end
end
