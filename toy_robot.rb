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
    if valid_place(x,y)
      @x = x
      @y = y
      @facing = facing
      replace_movements(x,y,facing)
    else
      raise InvalidPositionError.new("Invalid Position, #{x}, #{y}, #{facing}")
    end
  end

  def replace_movements(x,y,facing)
    @movements.replace(["PLACE #{x}, #{y}, #{facing.to_s.upcase}"])
  end

  def valid_place(x,y)
    (x.between?(0,4)) && (y.between?(0,4))
  end

  def move
    if (@facing == :north) && (@y < 4)
      @y =+ 1
      @movements << "MOVE"
    elsif (@facing == :south) && (@y > 0)
      @y =- 1
      @movements << "MOVE"
    elsif (@facing == :east) && (@x < 4)
      @x =+ 1
      @movements << "MOVE"
    elsif (@facing == :west) && (@x > 0)
      @x =- 1
      @movements << "MOVE"
    end
  end

end
