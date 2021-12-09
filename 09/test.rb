

def get_valid_adjacents(arr, index)
  # because that would mean there's no valid coords
  left = arr[index - 1].zero? || arr[index - 1] == 9 ? nil : index - 1
  right = arr[index + 1].nil? || arr[index + 1] == 9 ? nil : index + 1
  [left, right].compact
end

p get_valid_adjacents([9, 3, 2, 1, 2, 2, 9)
