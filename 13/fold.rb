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
end
