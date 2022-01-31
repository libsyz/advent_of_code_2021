require 'pry-byebug'

def snail_add(first, second)
  [first, second]
end

def add_on_right(element, number)
  return element if number.zero?
  return element + number if element.is_a? Integer

  if element.is_a? Array
    # figure out the first place I can add the number
    dive = element[1]

    until dive[1].is_a? Integer
      dive = dive[1]
    end

    dive += number
    return element
  end
end

def add_on_left(element, number)
  return element if number.zero?
  return element + number if element.is_a? Integer

  if element.is_a? Array
    # figure out the first place I can add the number
    dive = element[0]

    until dive[0].is_a? Integer
      dive = dive[0]
    end

    dive += number
    return element
  end
end


def explode(pair, nest)
  # binding.pry
  binding.pry if nest == 3
  return [pair, {right: 0, left: 0}] if pair.is_a? Integer

  # binding.pry
  if nest.zero?
    if pair.all? { |el| el.is_a? Integer }
      return [pair, { right: 0, left: 0} ]
    end

    if pair[0].is_a? Array
      value, data = explode(pair[0], nest + 1)
      return [ [ value, pair[1] + data[:right] ], data.merge({right: 0})].first
    end

    if pair[1].is_a? Array
      value, data = explode(pair[1], nest + 1)
      return [ [pair[0] + data[:left], value ], data.merge({left: 0})].first
    end
  end

  if nest.between?(1, 3)
    if pair.all? { |el| el.is_a? Integer }
      return [pair, { right: 0, left: 0 } ]
    end

    if pair[0].is_a? Array
      value, data = explode(pair[0], nest + 1)
      return [ [value , pair[1] + data[:right] ], data.merge({right: 0})]
    end

    if pair[1].is_a? Array
      value, data = explode(pair[1], nest + 1)
      return [[pair[0] + data[:left], value], data.merge({left: 0})]
    end

  end

  if nest == 4
    return [0, {left: pair[0], right: pair[1] } ]
  end

  return [pair, {left: 0, right: 0}] if pair.all? { |el| el.is_a? Integer }

end

# p explode([7,[6,[5,[4,[3,2]]]]], 0)
#  p explode([[6,[5,[4,[3,2]]]],1], 0)

p explode([[3,[2,[8,0]]],[9,[5,[4,[3,2]]]]], 0)
