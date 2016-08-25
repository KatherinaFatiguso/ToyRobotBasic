require_relative "toy_robot"

robot = ToyRobot.new
robot.place(3,3,:north)
puts robot.x
puts robot.y
puts robot.facing
robot.move
# p robot.movements
# robot.movements.each do |movement|
#   puts movement
# end

#
# robot.move
puts robot.x
puts robot.y
puts robot.facing
