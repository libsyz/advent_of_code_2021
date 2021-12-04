require 'rspec'
require '../bingo.rb'

describe "#bingo" do
  context "with advent of code data" do
    random_nums = [7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1]

    board_set = [
      [22, 13, 17, 11,  0,
        8,  2, 23,  4, 24,
       21,  9, 14, 16,  7,
        6, 10,  3, 18,  5,
        1, 12, 20, 15, 19
      ],
      [3, 15,  0,  2, 22,
       9, 18, 13, 17,  5,
      19,  8,  7, 25, 23,
      20, 11, 10, 24,  4,
      14, 21, 16, 12,  6
      ],
      [14, 21, 17, 24,  4,
       10, 16, 15,  9, 19,
       18,  8, 23, 26, 20,
       22, 11, 13,  6,  5,
        2,  0, 12,  3,  7
      ]
    ]

    res = bingo(random_nums, board_set)

    it 'chooses the third board set in the suite as the winner' do
      expect(res[:winner]).to eq(board_set[2])
    end

    it 'closes the bingo when the random numbers hit 24' do
      expect(res[:last_called]).to eq(24)
    end

    xit 'calculates the right multiplication value' do
      value = res[:winner].unmarked_sum * res[:last_called]
      expect(value).to eq(4512)
    end


  end


end
