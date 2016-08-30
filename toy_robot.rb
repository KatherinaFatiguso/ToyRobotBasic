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
    x = @x # assigning object variables to temporary variables
    y = @y

    case @facing
    when :north
      y += 1
    when :south
      y += -1
    when :east
      x += 1
    when :west
      x += -1
    end
    if !valid_place(x,y)
      raise InvalidPositionError.new("Invalid Position, #{x}, #{y}, #{facing}")
    else
      @x = x
      @y = y
      @movements << "MOVE"
    end

  end

  def left
    case @facing
    when :north
      @facing = :west
    when :west
      @facing = :south
    when :south
      @facing = :east
    when :east
      @facing = :north
    end
    @movements << "MOVE"
  end

  private

  def valid_place(x,y)
    (x.between?(0,4)) && (y.between?(0,4))
  end

end
