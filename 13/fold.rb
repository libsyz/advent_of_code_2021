require 'pry-byebug'

Point = Struct.new(:x, :y)

class InstructionReader
  attr_reader :points

  def initialize(point_array)
    @points = point_array.map { |p| Point[p[0], p[1]] }

    @max_x = @points.max_by { |p| p.x }.x
    @max_y = @points.max_by { |p| p.y }.y
  end

  def to_a
    arr = []
    (0..@max_y).each do |y|
      row = ['']
      (0..@max_x).each do |x|
        point = @points.find { |p| p.x == x && p.y == y }
        point ? row.first << '#' : row.first << '.'
      end
    arr << row
    end
    return arr
  end


  def fold!(position, direction:)
    if direction == :vertical
      fold_vertically(position)
    end

    if direction == :horizontal
      fold_horizontally(position)
    end
  end

  private

  def fold_vertically(position)
    split = @points.group_by { |p| p.y >= position }
    above_fold = split[false]
    below_fold = split[true]

    # anything below the fold needs to remap their y position
    # binding.pry

    below_fold.each do |point|
      point.y = position - (point.y - position)
    end

    @points = above_fold.concat(below_fold).uniq
    @points.delete_if { |p| p.y == position }    # @max_x = @points.max_by { |p| p.x }.x
    @max_y = position - 1
  end

  def fold_horizontally(position)
    split = @points.group_by { |p| p.x >= position }
    above_fold = split[false]
    below_fold = split[true]

    # anything below the fold needs to remap their y position
    # binding.pry

    below_fold.each do |point|
      point.x = position - (point.x - position)
    end

    @points = above_fold.concat(below_fold).uniq
    @points.delete_if { |p| p.x == position }    # @max_x = @points.max_by { |p| p.x }.x
    @max_x = position - 1
  end


end


# 0 1 2    3 4 5
#          0 1 2
# x x x  | x x x

# 0 1 2 3 | 4 5 6 7
# x x x x | x x x x


# 0
# 1
# 2
# 3
# -------------
# 4 3
# 5 2
# 6 1
# 7 0


# 0
# 1
# 2
# 3
# 4
# 5
# 6
# 7 ------------------
# 8  => 7 - (8 - 7) => 6
# 9  => 7 - (9 - 7) => 5
# 10 => 7 - (10 - 7) => 4
# 11 => 7 - (11 - 7) => 3
# 12 --
# 13 --
# 14 --
