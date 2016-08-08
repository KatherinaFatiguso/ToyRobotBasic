class ToyRobot
  validates_presence_of :x

  attr_accessor :x, :y, :f, :movements


  def initialize
    self.x = 0
    self.y = 0
    self.f = 'EAST'
  end

end

robot = ToyRobot.new
puts robot.x
puts robot.y
puts robot.f

# Note: to run this, in terminal type: $ ruby ToyRobot.rb
