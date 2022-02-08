
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
    # binding.pry
    p correspondance

    return true if correspondance.sort == anchor_values.sort
  end
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
