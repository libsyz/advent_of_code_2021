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

    describe "#low_points" do
      it "returns the low points in the input" do
        res = heightmap.low_points
        expect(res).to eq([1, 0, 5, 5])
      end
    end

    describe "#low_coordinates" do
      it "returns the coordinates in the input" do
        res = heightmap.low_coordinates
        expect(res).to eq([[0, 1], [0, 9], [2, 2], [4, 6]])
      end
    end

    describe "#get_basin_score" do
      it 'calculates the right amount of the length of the caves' do
        res = heightmap.get_basin_score
        expect(res).to eq(1134)
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
