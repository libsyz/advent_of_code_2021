require 'pry-byebug'
# @grid = [[1,1,1],
#          [2,3,1],
#          [2,3,1]]


@grid = [
        [1,1,6,3,7,5,1,7,4,2],
        [1,3,8,1,3,7,3,6,7,2],
        [2,1,3,6,5,1,1,3,2,8],
        [3,6,9,4,9,3,1,5,6,9],
        [7,4,6,3,4,1,7,1,1,1],
        [1,3,1,9,1,2,8,1,3,7],
        [1,3,5,9,9,1,2,4,2,1],
        [3,1,2,5,4,2,1,6,3,9],
        [1,2,9,3,1,3,8,5,2,1],
        [2,3,1,1,9,4,4,5,8,1]
      ]

# @grid = []

# File.readlines('input.txt').each do |line|
#   @grid << line.split('').map(&:to_i)
# end

# binding.pry
@max_row = @grid.length - 1
@max_col = @grid.first.length - 1

def impossible?(pos)
  row, col = pos

  return true if row > @max_row
  return true if col > @max_col

  return false
end

def end_routes(pos,memo = {}, sum = 0)
  # binding.pry
  row, col = pos

  if pos == [@max_row, @max_col]
    return sum + @grid[@max_row][@max_col]
  end

  if impossible?(pos)

    return Float::INFINITY
  end

  # I am out of bounds

  # otherwise, move down and right until you hit the base case
  down = end_routes([row + 1, col], memo, sum + @grid[row][col])
  right = end_routes([row, col + 1], memo, sum + @grid[row][col])

  memo["#{row}-#{col}"] = [down, right].min

  return memo["#{row}-#{col}"]

end


p end_routes([0, 0]) - @grid[0][0]
