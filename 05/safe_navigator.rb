
require 'pry-byebug'


# points = []

# File.readlines('./input.txt').each do |line|
#   point_pair = line.chomp.split(' -> ').map { |numstr| numstr.split(',').map(&:to_i)  }
#   points << point_pair
# end

def is_diagonal?(point_pair)
  first, second = point_pair
  length = first[0] - second[0]
  height = first[1] - second[1]
  height.abs == length.abs
end


def expand(point_pair, diagonal: false)
  start, finish = point_pair
  expanded = []
  # same y
  if diagonal && is_diagonal?(point_pair)
    # logic for getting points in a diagonal
    x0, x1 = [start[0], finish[0]]
    y0, y1 = [start[1], finish[1]]

    points = []
    # move back or forward
    if x0 < x1
      x0.upto(x1).each.with_index do |x|
        points <<  [x, nil]
      end
    else
      x0.downto(x1).each do |x|
        points <<  [x, nil]
      end
    end
    expanded.concat(points)
    # move up or down
    if y0 < y1
      y0.upto(y1).each.with_index do |y, idx|
        points[idx][1] = y
      end
    else
        y0.downto(y1).each.with_index do |y, idx|
        points[idx][1] = y
      end
    end

  elsif start[1] == finish[1]
    x0, x1 = [start[0], finish[0]]

    if x0 > x1
      x0.downto(x1).each { |x| expanded << [x, start[1]] }
    else
      x0.upto(x1).each { |x| expanded << [x, start[1]] }
    end
  # same x
  elsif start[0] == finish[0]
    y0, y1 = [start[1], finish[1]]
    if y0 > y1
      y0.downto(y1).each { |y| expanded << [start[0], y] }
    else
      y0.upto(y1).each { |y| expanded << [start[0], y] }
    end

    # no op
  end
  return expanded
end


def safe_navigator(data, diagonal: false)
  # generate a 10x10 matrix
  matrix = Array.new(999) { Array.new(999) { 0 }  }
  # go through each point pair
  data.each do |point_pair|

    points = expand(point_pair, diagonal: diagonal)
    next if points.empty?
    points.each do |point|
      matrix[point[0]][point[1]] += 1
    end
  end

  matrix.flatten.count { |num| num > 1 }
  # expand the points
  # check them against the matrix
end


p safe_navigator(points, diagonal: true)
