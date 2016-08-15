require_relative "invalid_position_error"

class ToyRobot
  attr_reader :x, :y, :f, :movements

  def initialize
    @x = 0
    @y = 0
    @f = :north
  end

  def place(x,y)
    raise InvalidPositionError.new("Invalid Position, #{x}, #{y}") if (x<0 || y<0 || x>4 || y>4)
    @x=x
    @y=y
  end
end

# robot = ToyRobot.new
# puts robot.x
# puts robot.y
# puts robot.f

# Note: to run this, in terminal type: $ ruby ToyRobot.rb
