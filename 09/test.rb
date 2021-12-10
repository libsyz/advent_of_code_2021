
require 'pry-byebug'

def get_cave(arr, starting_point)
  queue = [starting_point]
  already_processed = []
  valid = []

  while !queue.empty?

    queue.each do |point|
      valid << point if arr[point[0]][point[1]] != 9 || !already_processed.include?(point)
      already_processed << point
      adjacents = get_valid_adjacents(arr, point)
      queue.delete(point)

      adjacents.each do |point|
        queue << point unless already_processed.include?(point)
      end
    end
  end

  valid.map { |point| arr[point[0]][point[1]]   }

end


def get_valid_adjacents(arr, point)
  row, pos = point
  # because that would mean there's no valid coords
  behind = pos.zero? || arr[row][pos - 1] == 9 ? nil : [row, pos - 1]
  ahead = arr[row][pos + 1].nil? || arr[row][pos + 1] == 9 ? nil : [row, pos + 1]
  above = row.zero? || arr[row - 1][pos] == 9 ? nil : [row - 1, pos]
  below = arr[row + 1].nil? || arr[row + 1][pos] == 9 ? nil : [row + 1, pos]
  [behind, ahead, above, below].compact
end

p get_cave([[9, 9, 9, 2, 9, 9, 9],
            [9, 9, 2, 1, 2, 9, 9],
            [9, 9, 9, 2, 9, 9, 9]], [1, 3])
