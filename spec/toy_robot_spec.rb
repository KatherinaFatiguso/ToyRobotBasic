require "rspec"
require_relative "../toy_robot"

RSpec.describe "ToyRobot" do
  describe 'initialise' do
    subject{ ToyRobot.new }
    specify 'that ToyRobot x is set to 0' do
      expect(subject.x).to eq(0)
    end

    specify 'that ToyRobot y is set to 0' do
      expect(subject.y).to eq(0)
    end

    specify 'that ToyRobot facing is set to NORTH' do
      expect(subject.facing).to eq(:north)
    end
  end

  describe 'valid_place' do
    subject { ToyRobot.new }
    specify 'that when x value is between 0 and 4 and y value is between 0 and 4, it will return true' do
      x = 0
      y = 0
      expect(subject.valid_place(x,y)).to be true
    end

    specify 'that when x value is not between 0 and 4 and y value is not between 0 and 4, it will return false' do
      x = -1
      y = 5
      expect(subject.valid_place(x,y)).to be false
    end
  end ## end of describe 'valid_place'

  describe 'place' do
    subject{ ToyRobot.new }
    specify 'When x is less than zero, it expect to raise an exception' do
      expect { subject.place(-1,0,:north) }.to raise_error(InvalidPositionError, "Invalid Position, -1, 0, north")
    end
    specify 'When y is less than zero, it expect to raise an exception' do
      expect { subject.place(0,-1,:north) }.to raise_error(InvalidPositionError, "Invalid Position, 0, -1, north")
    end
    specify 'When x is more than four, it expect to raise an exception' do
      expect { subject.place(5,0,:north) }.to raise_error(InvalidPositionError, "Invalid Position, 5, 0, north")
    end
    specify 'When y is more than four, it expect to raise an exception' do
      expect { subject.place(0,5,:north) }.to raise_error(InvalidPositionError, "Invalid Position, 0, 5, north")
    end
    specify 'When given valid x and y, it should move Robot to position and update facing' do
      subject.place(3,4,:west)
      expect(subject.x).to eq(3)
      expect(subject.y).to eq(4)
      expect(subject.facing).to eq(:west)
    end

    specify 'When given valid x and y, the array @movements should have only 1 item' do
      subject.place(1,2,:north)
      expect(subject.movements.length).to eq(1)
    end

    specify 'When given valid x and y, the 1st item in array should have the place coordinate and facing' do
      subject.place(1,2,:north)
      expect(subject.movements[0]).to eq("PLACE 1, 2, NORTH")
    end
  end ## end of describe 'place'

  describe 'move' do
    context 'When the Robot is at Origin (0, 0, :north)' do
      it 'will move one position forward' do
        robot = ToyRobot.new
        robot.move
        expect(robot.x).to eq(0)
        expect(robot.y).to eq(1)
        expect(robot.facing).to eq(:north)
      end
    end

    context 'When the Robot is at valid move position' do
      robot = ToyRobot.new
      it 'will move one position forward' do
        robot.place(3,3,:north)
        robot.move
        expect(robot.x).to eq(3)
        expect(robot.y).to eq(4)
        expect(robot.facing).to eq(:north)
      end
      it 'will move one position forward' do
        robot.place(3,3,:south)
        robot.move
        expect(robot.x).to eq(3)
        expect(robot.y).to eq(2)
        expect(robot.facing).to eq(:south)
      end
      it 'will move one position forward' do
        robot.place(3,3,:east)
        robot.move
        expect(robot.x).to eq(4)
        expect(robot.y).to eq(3)
        expect(robot.facing).to eq(:east)
      end
    end

    context 'When the Robot is not at valid move position' do
      it 'will not move one position forward' do
        robot = ToyRobot.new
        robot.place(3,4,:north)
        robot.move
        expect(robot.x).to eq(3)
        expect(robot.y).to eq(4)
        expect(robot.facing).to eq(:north)
      end
    end
  end ## end of describe 'move'

end
