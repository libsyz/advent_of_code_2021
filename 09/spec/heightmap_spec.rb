require 'rspec'
require 'pry-byebug'
require_relative '../heightmap.rb'

  INPUT = [
          [2,1,9,9,9,4,3,2,1,0],
          [3,9,8,7,8,9,4,9,2,1],
          [9,8,5,6,7,8,9,8,9,2],
          [8,7,6,7,8,9,6,7,8,9],
          [9,8,9,9,9,6,5,6,7,8]
        ]

describe "Heightmap" do
  context "part 1 - counting low points" do

    heightmap = Heightmap.new(INPUT)

    describe "#low points" do
      it "returns the low points in the input" do
        res = heightmap.low_points
        expect(res).to eq([1, 0, 5, 5])
      end
    end

    describe "#sum" do
      it "returns a sum of all risk levels in the input" do
        res = heightmap.sum
        expect(res).to eq(15)
      end
    end
  end
end
