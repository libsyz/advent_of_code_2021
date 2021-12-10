require 'pry-byebug'

input = []
File.readlines('input.txt').each do |line|

  line = line.chomp
  row = line.split('').map { |el| el.to_i }
  input << row
end




class Heightmap
  attr_reader :low_points, :low_coordinates

  def initialize(input)
    @rows = input
    @cols = input.transpose
    @low_coordinates = []
    @basins = []
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
          if (min_value == point) && (adjacents.count(min_value) == 1)
            low_points << point
            @low_coordinates << [row_idx, point_idx]
          end
      end
    end
    low_points
  end

  def get_basin_score
    @low_coordinates.each do |coord|
      @basins << get_cave(coord)
    end
    @basins.map { |b| b.length }.max(3).reduce(:*)
  end

  def get_cave(low_point)
    queue = [low_point]
    already_processed = []
    valid = []

    while !queue.empty?

      queue.each do |point|
        valid << point if @rows[point[0]][point[1]] != 9 || !already_processed.include?(point)
        already_processed << point
        adjacents = get_valid_adjacents(point)
        queue.delete(point)

        adjacents.each do |point|
          queue << point unless already_processed.include?(point)
        end
      end
    end

    valid.map { |point| @rows[point[0]][point[1]]   }

  end


  def get_valid_adjacents(point)

    row, pos = point
    # because that would mean there's no valid coords
    behind = pos.zero? || @rows[row][pos - 1] == 9 ? nil : [row, pos - 1]
    ahead = @rows[row][pos + 1].nil? || @rows[row][pos + 1] == 9 ? nil : [row, pos + 1]
    above = row.zero? || @rows[row - 1][pos] == 9 ? nil : [row - 1, pos]
    below = @rows[row + 1].nil? || @rows[row + 1][pos] == 9 ? nil : [row + 1, pos]
    [behind, ahead, above, below].compact
  end
end


h = Heightmap.new(input)


p h.get_basin_score
