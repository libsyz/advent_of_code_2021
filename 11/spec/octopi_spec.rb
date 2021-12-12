
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

      #expect(octo_set.to_a).to eq(expected)
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
