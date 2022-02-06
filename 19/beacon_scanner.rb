
require 'pry-byebug'

def overlap?(scanner_one, scanner_two)

  # calculate the manhattan distances in the first scanner
  anchor_values = scanner_one.map do |beacon|
    (scanner_one[0][0] - beacon[0]).abs + (scanner_one[0][1] - beacon[1]).abs
  end

  scanner_two.each_with_index do |el, idx|
   correspondance = scanner_two.map do |beacon|
      (scanner_two[idx][0] - beacon[0]).abs + (scanner_two[idx][1] - beacon[1]).abs
    end
    binding.pry
    p correspondance

    return true if correspondance.sort == anchor_values.sort
  end


end
