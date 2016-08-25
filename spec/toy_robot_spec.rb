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

  describe 'replace_movements' do

    context 'When new position is given' do
      robot = ToyRobot.new
      robot.replace_movements(3,4,:south)
      it 'should replace any values with one item in the array' do
        expect(robot.movements.length).to eq 1
      end
      it 'should have the PLACE position in the first item in the array' do
        expect(robot.movements[0]).to eq "PLACE 3, 4, SOUTH"
      end
    end
  end


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
  end ## end of describe 'place'


  describe 'move' do
    subject { ToyRobot.new }
    context 'When the Robot is at Origin (0, 0, :north)' do
      it 'will move one position forward' do
        subject.move
        expect(subject.x).to eq(0)
        expect(subject.y).to eq(1)
        expect(subject.facing).to eq(:north)
      end
    end
  end ## end of describe 'move'

end
