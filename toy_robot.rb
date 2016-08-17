require_relative "invalid_position_error"

class ToyRobot
  attr_reader :x, :y, :facing, :movements

  def initialize
    @x = 0
    @y = 0
    @facing = :north
  end

  def place(x,y,f)
    raise InvalidPositionError.new("Invalid Position, #{x}, #{y}, #{f}") if (x<0 || y<0 || x>4 || y>4)
    @x=x
    @y=y
    @facing=f
  end
end

# robot = ToyRobot.new
# puts robot.x
# puts robot.y
# puts robot.facing

# Note: to run this, in terminal type: $ ruby ToyRobot.rb
