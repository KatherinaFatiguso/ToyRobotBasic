require_relative "invalid_position_error"

class ToyRobot
  attr_reader :x, :y, :facing, :movements

  def initialize
    @x = 0
    @y = 0
    @facing = :north
  end

  def place(x,y,facing)
    raise InvalidPositionError.new("Invalid Position, #{x}, #{y}, #{facing}") if !(x.between?(0,4)) || !(y.between?(0,4))
    @x = x
    @y = y
    @facing = facing
  end

  def move
    if (@facing == :north) && (@y < 4)
      @y =+ 1
    elsif (@facing == :south) && (@y > 0)
      @y =- 1
    elsif (@facing == :east) && (@x < 4)
      @x =+ 1
    elsif (@facing == :west) && (@x > 0)
      @x =- 1
    end
  end

end


# robot = ToyRobot.new
# puts robot.x
# puts robot.y
# puts robot.facing
#
# robot.move
# puts robot.x
# puts robot.y
# puts robot.facing


# Note: to run this, in terminal type: $ ruby ToyRobot.rb
