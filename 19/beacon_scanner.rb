require_relative './spec/example_data.rb'
require 'pry-byebug'

def overlap?(scanners)
  manhattans = []
  scanners.first.each_with_index do |ref, i|
    # I want to get all the manhattan distances
    scanners.last.each do |banana, j|
      binding.pry
      (ref[0] - beacon[0]).abs + (ref[1] - beacon[1]).abs + (ref[2] - beacon[2]).abs
    end

    manhattans << manhattan_distance
  end
  manhattans
end


def beacon_counter(scanners)
  # calculate the manhattan distances in the first scanner
  anchor_values = scanners[0].map do |beacon|
    (scanners[0][0][0] - beacon[0]).abs + (scanners[0][0][1] - beacon[1]).abs + (scanners[0][0][2] - beacon[2]).abs
  end

 beacon_count = 0

  scanners[1].each_with_index do |el, idx|
    correspondance = scanners[1].map do |beacon|
      (scanners[1][idx][0] - beacon[0]).abs + (scanners[1][idx][1] - beacon[1]).abs + (scanners[1][idx][2] - beacon[2]).abs
    end

    new_count = anchor_values.count { |distance| correspondance.include?(distance) }

    beacon_count = new_count if new_count > beacon_count
    # be careful with this line, it low-key assumes that all the manhattan distances will be unique
  end

  beacon_count
end


p overlap?([SCANNER_ZERO, SCANNER_ONE])
