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
    subject { ToyRobot.new }
    it 'When facing north will move one position north' do
      subject.place(1, 1, :north)
      subject.move
      expect(subject.y).to eq(2)
    end

    it 'When facing south will move one position south' do
      subject.place(1, 1, :south)
      subject.move
      expect(subject.y).to eq(0)
    end

    it 'When facing east will move one position east' do
      subject.place(1, 1, :east)
      subject.move
      expect(subject.x).to eq(2)
    end

    it 'When facing west will move one position west' do
      subject.place(1, 1, :west)
      subject.move
      expect(subject.x).to eq(0)
    end

  end ## end of describe 'move'

  describe 'left' do
    subject { ToyRobot.new }
    it 'When facing north will face west when turn left' do
      subject.place(1, 1, :north)
      subject.left
      expect(subject.facing).to eq(:west)
    end
    it 'When facing west will face south when turn left' do
      subject.place(1, 1, :west)
      subject.left
      expect(subject.facing).to eq(:south)
    end
    it 'When facing south will face east when turn left' do
      subject.place(1, 1, :south)
      subject.left
      expect(subject.facing).to eq(:east)
    end
    it 'When facing east will face north when turn left' do
      subject.place(1, 1, :east)
      subject.left
      expect(subject.facing).to eq(:north)
    end
  end # end of describe left

end
