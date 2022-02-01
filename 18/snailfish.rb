require 'pry-byebug'

def snail_add(first, second)
  [first, second]
end

def add_on_right(element, number)
  return element if number.zero?
  return element + number if element.is_a? Integer

  if element.is_a? Array
    dive = nil
    # figure out the first place I can add the number
     until dive.is_a?(Array) && dive.all? { |el| el.is_a? Integer }
      dive ? dive = dive[1] : dive = element[1]
    end
    # binding.pry if dive.is_a? Array
    dive[1] += number

    return element
  end
end

def add_on_left(element, number)
  return element if number.zero?
  return element + number if element.is_a? Integer

  if element.is_a? Array
    # figure out the first place I can add the number
    dive = element
    until dive[0].is_a? Integer
      dive = dive[0]
    end

    dive[0] += number

    return element
  end
end


def explode(pair, nest)


  return [pair, {right: 0, left: 0}] if pair.is_a? Integer


  if nest.zero?
    final = pair

    if pair.all? { |el| el.is_a? Integer }
      return final
    end

    if pair[0].is_a? Array
      value, data = explode(pair[0], nest + 1)
      final[0] = value
      # binding.pry
      final[1] = add_on_left(pair[1], data[:right])
    end

    if pair[1].is_a? Array
      value, data = explode(pair[1], nest + 1)
      final[1] = value
      final[0] = add_on_right(pair[0], data[:left])
    end

    return final
  end

  if nest.between?(1, 3)
    if pair.all? { |el| el.is_a? Integer }
      return [pair, { right: 0, left: 0 } ]
    end

    if pair[0].is_a? Array
      value, data = explode(pair[0], nest + 1)
      return [ [value , add_on_right(pair[1], data[:right]) ], data.merge({right: 0})]
    end

    if pair[1].is_a? Array
      value, data = explode(pair[1], nest + 1)
      return [[add_on_left(pair[0], data[:left]), value], data.merge({left: 0})]
    end

  end

  if nest == 4
    return [0, {left: pair[0], right: pair[1] } ]
  end

  return [pair, {left: 0, right: 0}] if pair.all? { |el| el.is_a? Integer }

end


def split(number)
  return number if number < 10
  n = number / 2
  [n, number - n]
end

def split_pair(pair)
  result = []
  pair.each_with_index do |el, idx|
    var = nil

    if el.is_a? Integer
      result << split(pair[idx])
    end

    if el.is_a?(Array)
      result << split_pair(pair[idx])
    end
  end

  return result

end

p split_pair([[[[0,7],4],[15,[0,13]]],[1,1]])
