require 'pry-byebug'
@grid = [[1,1,1],
         [2,3,1],
         [2,3,1]]


@grid = [
        [1,1,6,3,7,5,1,7,4,2],
        [1,3,8,1,3,7,3,6,7,2],
        [2,1,3,6,5,1,1,3,2,8],
        [3,6,9,4,9,3,1,5,6,9],
        [7,4,6,3,4,1,7,1,1,1],
        [1,3,1,9,1,2,8,1,3,7],
        [1,3,5,9,9,1,2,4,2,1],
        [3,1,2,5,4,2,1,6,3,9],
        [1,2,9,3,1,3,8,5,2,1],
        [2,3,1,1,9,4,4,5,8,1]
      ]


def impossible?(pos)
  x, y = pos

  return true if [x,y].any? do |coord|
    coord > 9
  end

  return false
end

def end_routes(pos, routes = [],sum = 0)
  x, y = pos
  return [] if impossible?(pos)

  if pos == [9, 9]

    routes.push(sum + @grid[9][9])
    return routes
  end

  # binding.pry
  p "x: #{x}, y: #{y}"
  return end_routes([x + 1, y], routes, sum + @grid[x][y]).concat(end_routes([x, y + 1], routes, sum + @grid[x][y]))

end


p end_routes([0, 0]).min
