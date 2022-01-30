require 'pry-byebug'

def snail_add(first, second)
  [first, second]
end


def explode(pair, nest)
  # how can I know if something has been nested 4 times?
  return pair if pair.is_a? Integer

  if nest == 4
    return 0
  end

  return pair if pair.is_a?(Array) && pair.all? { |el| el.is_a? Integer }

  [explode(pair[0], nest + 1), explode(pair[1], nest + 1)]
end

 p explode([7,[6,[5,[4,[3,2]]]]], 0)
