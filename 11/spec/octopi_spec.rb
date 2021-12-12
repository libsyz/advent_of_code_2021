
require 'rspec'
require_relative '../octopi.rb'

describe "#flash_counter" do
  context "with a very simple set of octopi" do
    simple_octopi =[
      [1,1,1,1,1],
      [1,9,9,9,1],
      [1,9,1,9,1],
      [1,9,9,9,1],
      [1,1,1,1,1]
    ]

    it 'gets the right state after 1 step' do
      expected =  [[3,4,5,4,3],
      [4,0,0,0,4],
      [5,0,0,0,5],
      [4,0,0,0,4],
      [3,4,5,4,3]]
      octo_set = OctopiSet.new(simple_octopi)
      octo_set.step!
      expect(octo_set.to_a).to eq(expected)
    end

    it 'gets the right state after 2 steps' do
      expected = [[4,5,6,5,4],
      [5,1,1,1,5],
      [6,1,1,1,6],
      [5,1,1,1,5],
      [4,5,6,5,4]]
      octo_set = OctopiSet.new(simple_octopi)
      2.times { octo_set.step! }
      expect(octo_set.to_a).to eq(expected)
    end

  end

  context "with a larger set of octopi" do
    initial_state = [
      [5, 4, 8, 3, 1, 4, 3, 2, 2, 3],
      [2, 7, 4, 5, 8, 5, 4, 7, 1, 1],
      [5, 2, 6, 4, 5, 5, 6, 1, 7, 3],
      [6, 1, 4, 1, 3, 3, 6, 1, 4, 6],
      [6, 3, 5, 7, 3, 8, 5, 4, 7, 8],
      [4, 1, 6, 7, 5, 2, 4, 6, 4, 5],
      [2, 1, 7, 6, 8, 4, 1, 7, 2, 1],
      [6, 8, 8, 2, 8, 8, 1, 1, 3, 4],
      [4, 8, 4, 6, 8, 4, 8, 5, 5, 4],
      [5, 2, 8, 3, 7, 5, 1, 5, 2, 6]
    ]

    it "gets the right octopus configuration after 1 step" do
      expected = [
        [6,5,9,4,2,5,4,3,3,4],
        [3,8,5,6,9,6,5,8,2,2],
        [6,3,7,5,6,6,7,2,8,4],
        [7,2,5,2,4,4,7,2,5,7],
        [7,4,6,8,4,9,6,5,8,9],
        [5,2,7,8,6,3,5,7,5,6],
        [3,2,8,7,9,5,2,8,3,2],
        [7,9,9,3,9,9,2,2,4,5],
        [5,9,5,7,9,5,9,6,6,5],
        [6,3,9,4,8,6,2,6,3,7]
      ]
      octo_set = OctopiSet.new(initial_state)
      octo_set.step!
      expect(octo_set.to_a).to eq(expected)

    end

    it "gets the right octopus configuration after 2 steps" do
      expected = [
                  [8,8,0,7,4,7,6,5,5,5],
                  [5,0,8,9,0,8,7,0,5,4],
                  [8,5,9,7,8,8,9,6,0,8],
                  [8,4,8,5,7,6,9,6,0,0],
                  [8,7,0,0,9,0,8,8,0,0],
                  [6,6,0,0,0,8,8,9,8,9],
                  [6,8,0,0,0,0,5,9,4,3],
                  [0,0,0,0,0,0,7,4,5,6],
                  [9,0,0,0,0,0,0,8,7,6],
                  [8,7,0,0,0,0,6,8,4,8]
      ]
      octo_set = OctopiSet.new(initial_state)
      2.times { octo_set.step! }
      expect(octo_set.to_a).to eq(expected)

    end

    it "gets the right octopus configuration after 10 steps" do
      expected = [
                  [0, 4, 8, 1, 1, 1, 2, 9, 7, 6],
                  [0, 0, 3, 1, 1, 1, 2, 0, 0, 9],
                  [0, 0, 4, 1, 1, 1, 2, 5, 0, 4],
                  [0, 0, 8, 1, 1, 1, 1, 4, 0, 6],
                  [0, 0, 9, 9, 1, 1, 1, 3, 0, 6],
                  [0, 0, 9, 3, 5, 1, 1, 2, 3, 3],
                  [0, 4, 4, 2, 3, 6, 1, 1, 3, 0],
                  [5, 5, 3, 2, 2, 5, 2, 3, 5, 0],
                  [0, 5, 3, 2, 2, 5, 0, 6, 0, 0],
                  [0, 0, 3, 2, 2, 4, 0, 0, 0, 0]
      ]
      octo_set = OctopiSet.new(initial_state)
      10.times { octo_set.step! }
      expect(octo_set.to_a).to eq(expected)
    end

    it "gets the right number of flashes after 10 steps" do
      octo_set = OctopiSet.new(initial_state)
      10.times { octo_set.step! }
      expect(octo_set.flash_count).to eq(204)
    end

    it "gets the right number of flashes after 100 steps" do
      octo_set = OctopiSet.new(initial_state)
      100.times { octo_set.step! }
      expect(octo_set.flash_count).to eq(1656)
    end

    it "synchronizes after 195 steps" do
      octo_set = OctopiSet.new(initial_state)
      195.times { octo_set.step! }
      expect(octo_set.synchronyzed?).to eq(true)
    end
  end



end


#   xcontext "with a starting set of octopi" do
#    octopi = [
#             [5,4,8,3,1,4,3,2,2,3],
#             [2,7,4,5,8,5,4,7,1,1],
#             [5,2,6,4,5,5,6,1,7,3],
#             [6,1,4,1,3,3,6,1,4,6],
#             [6,3,5,7,3,8,5,4,7,8],
#             [4,1,6,7,5,2,4,6,4,5],
#             [2,1,7,6,8,4,1,7,2,1],
#             [6,8,8,2,8,8,1,1,3,4],
#             [4,8,4,6,8,4,8,5,5,4],
#             [5,2,8,3,7,5,1,5,2,6]
#             ]
#   end

#   end



# end
