require 'pry-byebug'

input = []
File.readlines('input.txt').each do |line|

  line = line.chomp
  row = line.split('').map { |el| el.to_i }
  input << row
end




class Heightmap
  attr_reader :low_points
  def initialize(input)
    @rows = input
    @cols = input.transpose
    @low_points = calculate_low_points
  end

  def point_above(row_idx, point_idx)
    return nil if row_idx.zero?

    @rows[row_idx - 1][point_idx]
  end

  def point_below(row_idx, point_idx)
    if @rows[row_idx + 1]
      return @rows[row_idx + 1][point_idx]
    end
  end

  def point_behind(row, point_idx)
    return nil if point_idx.zero?

    row[point_idx - 1]
  end

  def point_ahead(row, point_idx)
    row[point_idx + 1]
  end

  def sum
    @low_points.sum { |point| point + 1 }
  end

  def calculate_low_points
    low_points = []
    @rows.each_with_index do |row, row_idx|
      row.each_with_index do |point, point_idx|
          # binding.pry
          adjacents = [ point, point_ahead(row, point_idx), point_behind(row, point_idx), point_above(row_idx, point_idx), point_below(row_idx, point_idx)]
          min_value = adjacents.compact.min
          low_points << point if (min_value == point) && (adjacents.count(min_value) == 1)
      end
    end
    low_points
  end
end


h = Heightmap.new(input)
p h.calculate_low_points
p h.sum
