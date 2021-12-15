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

input = []
File.readlines('input.txt').each do |line|
  input << line.split(',').map(&:to_i)
end


reader = InstructionReader.new(input)
reader.fold!(655, direction: :horizontal)
reader.fold!(447, direction: :vertical)
reader.fold!(327, direction: :horizontal)
reader.fold!(223, direction: :vertical)
reader.fold!(163, direction: :horizontal)
reader.fold!(111, direction: :vertical)
reader.fold!(81, direction: :horizontal)
reader.fold!(55, direction: :vertical)
reader.fold!(40, direction: :horizontal)
reader.fold!(27, direction: :vertical)
reader.fold!(13, direction: :vertical)
reader.fold!(6, direction: :vertical)

puts reader.to_a
# fold along x=655
# fold along y=447
# fold along x=327
# fold along y=223
# fold along x=163
# fold along y=111
# fold along x=81
# fold along y=55
# fold along x=40
# fold along y=27
# fold along y=13
# fold along y=6
