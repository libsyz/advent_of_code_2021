require 'pry-byebug'
# @grid = [[1,1,1],
#          [2,3,1],
#          [2,3,1]]


# @grid = [
#         [1,1,6,3,7,5,1,7,4,2],
#         [1,3,8,1,3,7,3,6,7,2],
#         [2,1,3,6,5,1,1,3,2,8],
#         [3,6,9,4,9,3,1,5,6,9],
#         [7,4,6,3,4,1,7,1,1,1],
#         [1,3,1,9,1,2,8,1,3,7],
#         [1,3,5,9,9,1,2,4,2,1],
#         [3,1,2,5,4,2,1,6,3,9],
#         [1,2,9,3,1,3,8,5,2,1],
#         [2,3,1,1,9,4,4,5,8,1]
#       ]

input_grid = []

File.readlines('./input.txt').each do |line|
  input_grid << line.chomp.split('').map(&:to_i)
end




def impossible?(pos, grid)
  row, col = pos
  @max_row ||= grid.length - 1
  @max_col ||= grid.first.length - 1

  return true if row.negative?
  return true if col.negative?
  return true if row > @max_row
  return true if col > @max_col

  return false
end

def end_routes(pos, grid, memo = {}, sum = 0)
  # binding.pry
  row, col = pos
  @max_row ||= grid.length - 1
  @max_col ||= grid.first.length - 1

  if pos == [@max_row, @max_col]
    return grid[@max_row][@max_col]
  end

  if impossible?(pos, grid)
    return Float::INFINITY
  end


  if memo.has_key?("#{row}-#{col}")
    return memo["#{row}-#{col}"]
  end

  # I am out of bounds

  # otherwise, move down and right until you hit the base case
  go_down = end_routes([row + 1, col], grid, memo, sum + grid[row][col])
  go_right = end_routes([row, col + 1], grid, memo, sum + grid[row][col])

  memo["#{row}-#{col}"] = [go_down, go_right].min + grid[row][col]
  # binding.pry if row == 0 and col == 0
  return [go_down, go_right].min + grid[row][col]
end


def came_from?(direction, pos, coming_from = nil)
  return false if coming_from.nil?

  row, col = pos

  if direction == :right
    return true if col + 1 == coming_from[1]
  end

  if direction == :left
    return true if col - 1 == coming_from[1]
  end

  if direction == :up
    return true if row - 1 == coming_from[0]
  end

  if direction == :down
    return true if row + 1 == coming_from[0]
  end

  return false



end

def end_routes_hinge(pos, grid, memo = {}, sum = 0, coming_from = nil)
  # binding.pry
  row, col = pos
  @max_row ||= grid.length - 1
  @max_col ||= grid.first.length - 1

  if impossible?(pos, grid)
    return Float::INFINITY
  end
  # my base cases


  if pos == [@max_row, @max_col]
    return grid[@max_row][@max_col]
  end


  # binding.pry
  go_up = came_from?( :up, pos, coming_from ) ? Float::INFINITY : end_routes_hinge([row - 1, col], grid, memo, sum + grid[row][col], pos)
  go_down = came_from?( :down, pos, coming_from ) ? Float::INFINITY : end_routes_hinge([row + 1, col], grid, memo, sum + grid[row][col], pos)
  go_left = came_from?(:left, pos, coming_from) ? Float::INFINITY : end_routes_hinge([row , col - 1], grid, memo, sum + grid[row][col], pos)
  go_right = came_from?(:right, pos, coming_from) ? Float::INFINITY : end_routes_hinge([row, col + 1], grid, memo, sum + grid[row][col], pos)


  return [go_down, go_right, go_left, go_up].min + grid[row][col]


end


def grid_generator(grid)
  # modify all the rows in the grid
  target = Array.new(grid.length) { [] }
  5.times do |n|
    grid.each_with_index do |row, idx|
      row.each do |el|
        value = (el + n > 9) ? (el + n - 9) : (el + n)
        target[idx] << value
      end
    end
  end

  target_rows = []

  (0..4).each do |n|
    target.each do |row|
      target_rows << row.map { |el| value = (el + n > 9) ? (el + n - 9) : (el + n) }
    end
  end


  target_rows
end


# grid = grid_generator(input_grid)




# p end_routes([0,0], grid) - grid[0][0]
