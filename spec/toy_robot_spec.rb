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
    specify 'When valid it should move Robot to position and update facing' do
      subject.place(3,4,:west)
      expect(subject.x).to eq(3)
      expect(subject.y).to eq(4)
      expect(subject.facing).to eq(:west)
    end

  end ## end of describe 'place'

  describe 'move' do
    subject { ToyRobot.new }
    context 'When the Robot is at Origin (0, 0, :north)' do
      it 'it will move one position forward' do
        subject.move
        expect(subject.x).to eq(0)
        expect(subject.y).to eq(1)
        expect(subject.facing).to eq(:north)
      end
    end

    context 'When the Robot is at the edge of the table' do
      it 'will not move from its current position' do
        subject.place(0, 4, :north)
        subject.move
        expect(subject.x).to eq(0)
        expect(subject.y).to eq(4)
        expect(subject.facing).to eq(:north)
      end
      it 'will not move from its current position' do
        subject.place(0, 0, :south)
        subject.move
        expect(subject.x).to eq(0)
        expect(subject.y).to eq(0)
        expect(subject.facing).to eq(:south)
      end
    end

    context 'When a Robot is moved to a valid place' do
      it 'will add string MOVE to the last place in the movements array' do
        subject.place(1, 1, :east)
        subject.move
        expect(subject.movements.last).to eq('MOVE')
      end
    end
  end ## end of describe 'move'

end
