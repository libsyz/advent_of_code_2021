
require 'pry-byebug'

def get_cave(arr, start_point)
  queue = [start_point]
  already_processed = []
  valid = []

  while !queue.empty?
    queue.each do |coord|
      valid << coord if arr[coord] != 9 || !already_processed.include?(coord)
      already_processed << coord
      adjacents = get_valid_adjacents(arr, coord)
      queue.delete(coord)

      adjacents.each do |coord|
        queue << coord unless already_processed.include?(coord)
      end
    end
  end

  valid.map { |idx| arr[idx] }

end


def get_valid_adjacents(arr, index)
  # because that would mean there's no valid coords
  left = arr[index - 1].zero? || arr[index - 1] == 9 ? nil : index - 1
  right = arr[index + 1].nil? || arr[index + 1] == 9 ? nil : index + 1
  [left, right].compact
end

p get_cave([9, 3, 2, 1, 2, 2, 9], 3)
