
require 'rspec'
require_relative './../fold.rb'

describe "InstructionReader" do
  let(:test_input) { [[6,10],
                 [0,14],
                 [9,10],
                 [0,3],
                 [10,4],
                 [4,11],
                 [6,0],
                 [6,12],
                 [4,1],
                 [0,13],
                 [10,12],
                 [3,4],
                 [3,0],
                 [8,4],
                 [1,10],
                 [2,14],
                 [8,10],
                 [9,0]]  }

  describe "#initialize" do

    it "builds a bunch of points based on coordinates" do
      reader = InstructionReader.new(test_input)
      expect(reader.points).not_to be_empty
      expect(reader.points[0].class).to eq Point
    end

  end

  describe "#to_a" do
    it "plots the dots on the chart accurately" do
     reader = InstructionReader.new(test_input)
      expected =[ ["...#..#..#."],
                  ["....#......"],
                  ["..........."],
                  ["#.........."],
                  ["...#....#.#"],
                  ["..........."],
                  ["..........."],
                  ["..........."],
                  ["..........."],
                  ["..........."],
                  [".#....#.##."],
                  ["....#......"],
                  ["......#...#"],
                  ["#.........."],
                  ["#.#........"]]

      expect(reader.to_a).to eq(expected)
    end
  end


  describe "#fold" do
    context "with a vertical fold" do
      it "produces the right plot after folding vertically on index 7" do
        reader = InstructionReader.new(test_input)
        reader.fold!(7, direction: :vertical)
        expected =[["#.##..#..#."],
                   ["#...#......"],
                   ["......#...#"],
                   ["#...#......"],
                   [".#.#..#.###"],
                   ["..........."],
                   ["..........."]]

        expect(reader.to_a).to eq(expected)
      end

      it "produces the right plot after folding horizontally on index 3"
    end


  end



  end
