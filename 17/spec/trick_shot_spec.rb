
require 'rspec'
require_relative '../trick_shot.rb'

describe "#trick_shot" do
  context "with a target area x=20..30, y=-10..-5" do
    it "returns a maximum height reached of 45" do
      max_height = trick_shot(x: (20..30), y: (-10..-5))
    end
  end
end
