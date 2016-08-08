require "rspec"
require_relative "../toy_robot"

RSpec.describe "ToyRobot" do
  subject{ ToyRobot.new }
  specify 'that ToyRobot x is set to 0' do
    expect(subject.x).to eq(0)
  end

  specify 'that ToyRobot y is set to 0' do
    expect(subject.y).to eq(0)
  end

  specify 'that ToyRobot f is set to EAST' do
    expect(subject.f).to eq('EAST')
  end

  it { is_expected.to validate_presence_of(:x) }
end

#Note, to run this RSpec test, in terminal, type $ rspec spec/toy_robot_spec.rb
