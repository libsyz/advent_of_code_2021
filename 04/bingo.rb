require 'pry-byebug'
require_relative 'board_factory'

# counter = 0
# random_sequence = []
# boards = []
# temp_board_data = []

# File.readlines('input.txt').each do |line|
#   # binding.pry
#   # first line should be built for the sequence
#   if counter.zero?
#     random_sequence = line.split(',').map(&:to_i)
#   end

#   # start generating boards
#   # each empty line declares the beginning of a new board
#   if line.chomp.empty?
#     boards << temp_board_data unless temp_board_data.empty?
#     temp_board_data = []
#   end

#   if counter > 1 && !line.chomp.empty?
#     temp_board_data << line.chomp.split.map(&:to_i)
#   end

#   counter += 1
# end



def bingo(random_sequence, boards)
  res = {}

  bingo_boards = BoardFactory.generate(boards, random_sequence)
  random_sequence.each do |num|

    res[:last_called] = num
    bingo_boards.each do |board|

      board.mark_at(num)
      res[:winner] = board and return res if board.bingo?
    end
  end
  res
end

def last_bingo(random_sequence, boards)
  res = {}

  bingo_boards = BoardFactory.generate(boards, random_sequence)
  random_sequence.each do |num|

    res[:last_called] = num
    bingo_boards.each do |board|

      board.mark_at(num)
      res[:last_winner] = board and return res if bingo_boards.all?(&:bingo?)
    end
  end
  res
end


# res =  last_bingo(random_sequence, boards)
# value = res[:last_winner].unmarked_sum * res[:last_called]
# p value
