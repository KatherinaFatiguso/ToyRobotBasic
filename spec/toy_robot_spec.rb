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

    specify 'that ToyRobot f is set to NORTH' do
      expect(subject.f).to eq(:north)
    end
  end

  describe 'place' do
    subject{ ToyRobot.new }
    specify 'When x is less than zero, it expect to raise an exception' do
      expect { subject.place(-1,0) }.to raise_error(InvalidPositionError, "Invalid Position, -1, 0")
    end
    specify 'When y is less than zero, it expect to raise an exception' do
      expect { subject.place(0,-1) }.to raise_error(InvalidPositionError, "Invalid Position, 0, -1")
    end
    specify 'When x is more than four, it expect to raise an exception' do
      expect { subject.place(5,0) }.to raise_error(InvalidPositionError, "Invalid Position, 5, 0")
    end
    specify 'When y is more than four, it expect to raise an exception' do
      expect { subject.place(0,5) }.to raise_error(InvalidPositionError, "Invalid Position, 0, 5")
    end
    specify 'When valid x value 3 is entered, it will place the robot in position x' do
      expect { subject.place(3,4).to change(subject, :x).from(0).to(3) }
    end
    specify 'When valid y value 4 is entered, it will place the robot in position y' do
      expect { subject.place(3,4).to change(subject, :y).from(0).to(4) }
    end
  end

end
