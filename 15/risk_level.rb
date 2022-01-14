require 'pry-byebug'
# # @grid = [[1,1,1],
# #          [2,3,1],
# #          [2,3,1]]


# # @grid = [
# #         [1,1,6,3,7,5,1,7,4,2],
# #         [1,3,8,1,3,7,3,6,7,2],
# #         [2,1,3,6,5,1,1,3,2,8],
# #         [3,6,9,4,9,3,1,5,6,9],
# #         [7,4,6,3,4,1,7,1,1,1],
# #         [1,3,1,9,1,2,8,1,3,7],
# #         [1,3,5,9,9,1,2,4,2,1],
# #         [3,1,2,5,4,2,1,6,3,9],
# #         [1,2,9,3,1,3,8,5,2,1],
# #         [2,3,1,1,9,4,4,5,8,1]
# #       ]

# input_grid = []

# File.readlines('./input.txt').each do |line|
#   input_grid << line.chomp.split('').map(&:to_i)
# end




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


def dijsktra(table)
  # maintain a distance_arr where the distance to every node is infinity
  # mark the distance to the start_node to be 0
    graph = {
        0 => [ [1, 1], [3, 9]],
        1 =>  [[0, 1], [2, 9], [4, 1]],
        2 => [ [1, 1], [5, 9]],
        3 => [ [0, 1], [4, 1], [6,9]],
        4 => [ [3,9], [1, 1], [5, 9], [7, 1]],
        5 => [ [4,1], [2,9], [8, 1]],
        6 => [ [3, 9], [7,1]],
        7 => [ [6, 9], [4, 1], [8, 1]],
        8 => [ [7, 1], [5,9]]
      }
  # graph = graph_generator(res)
  #binding.pry
  distances = graph.keys.map { Float::INFINITY }
  distances[0] = 0
               # node
                  # distance to node
  prio_queue = [[0, 0]]
  visited = []

  until prio_queue.empty?
      # sleep 1
      current_node = prio_queue.min { |(node, distance)| distance }
      prio_queue.delete(current_node  )
      p prio_queue
      visited << current_node[0]
      adjacents = graph[current_node[0]]
      adjacents.each do |(node, distance)|
        unless visited.include?(node)
          distances[node] = distance + current_node[1] if (distance + current_node[1]) <= distances[node]
          prio_queue << [ node, distances[node] ]
        end
      end
  end
  binding.pry
  distances.last
end


def grid_generator(grid)
  binding.pry
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
  counter = 0
  grid_array.each_with_index do |row, row_idx|
    row.each_with_index do |col, col_idx|
      counter += 1
      graph[(row_idx * 3) + col_idx] = get_adjacents(grid_array, row_idx, col_idx)
    end
  end
  p counter
  graph
end

# grid = grid_generator(input_grid)

binding.pry

p dijsktra(10)

# p end_routes([0,0], grid) - grid[0][0]
