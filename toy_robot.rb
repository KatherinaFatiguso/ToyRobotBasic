require_relative "invalid_position_error"

class ToyRobot
  attr_reader :x, :y, :facing, :movements

  def initialize
    @x = 0
    @y = 0
    @facing = :north
    @movements = []
  end

  def place(x,y,facing)
    if !valid_place(x,y)
      raise InvalidPositionError.new("Invalid Position, #{x}, #{y}, #{facing}")
    end
    @x = x
    @y = y
    @facing = facing
    @movements.replace(["PLACE #{x}, #{y}, #{facing.to_s.upcase}"])
  end

  def move
    if (@facing == :north) && (valid_place(@x,(@y + 1)))
      @y += 1
    elsif (@facing == :south) && (valid_place(@x,(@y - 1)))
      @y -= 1
    elsif (@facing == :east) && (valid_place((@x + 1), @y))
      @x += 1
    elsif (@facing == :west) && (valid_place((@x - 1), @y))
      @x -= 1
    end
  end

  def valid_place(x,y)
    (x.between?(0,4)) && (y.between?(0,4))
  end

end
