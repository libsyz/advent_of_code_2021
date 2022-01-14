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


def dijsktra(graph)
  # maintain a distance_arr where the distance to every node is infinity
  # mark the distance to the start_node to be 0

  distance_arr = graph.keys.map { Float::INFINITY }
  start_node = distance_arr[0]
  dist_to_current_node = distance_arr[0]
  # maintain a priority queue of key value pairs that which tell you which node
  # to visit based on sorted minimum value
  queue = []
  visited = []
  # insert {s: 0} in the priority queue
  current_node = 0
  until queue.empty?
    distances = []
    visited << current_node
    # iterate through all the edges outwards from the priority queue
    graph[current_node].each do |(node, distance)|
      distance_arr[node] = distance
      distances << [node, distance]
    end


      # whaaat why is this so hard
      # to relax the node means to choose the minimum value already?
      queue << graph[edge[0]]
    end
    # and relax the node appending a new key value pair to the queue
  end

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

def get_adjacents(grid_array, row_idx, col_idx)

  up = if row_idx - 1 >= 0
      [ ((row_idx - 1) * 3) + col_idx , grid_array[row_idx - 1][col_idx] ]
    else
      nil
  end

  down = if grid_array[row_idx + 1]
      [ ((row_idx + 1) * 3) + col_idx , grid_array[row_idx + 1][col_idx] ]
    else
      nil
  end

  right = if grid_array[row_idx][col_idx + 1]
      [ (row_idx * 3) + (col_idx + 1) , grid_array[row_idx][col_idx + 1]]
    else
    nil
  end

  left = if col_idx - 1 >= 0
      [ (row_idx * 3) + (col_idx - 1) , grid_array[row_idx][col_idx - 1] ]
    else
    nil
  end

  [left, right, up, down].compact.empty? ? nil : [left, right, up, down].compact
end

def graph_generator(grid_array)
  graph = {}
  grid_array.each_with_index do |row, row_idx|
    row.each_with_index do |col, col_idx|
      graph[(row_idx * 3) + col_idx] = get_adjacents(grid_array, row_idx, col_idx)
    end
  end
  graph
end

# grid = grid_generator(input_grid)




# p end_routes([0,0], grid) - grid[0][0]
