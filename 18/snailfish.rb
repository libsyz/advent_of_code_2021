require 'pry-byebug'

def snail_add(first, second)
  [first, second]
end


def explode(pair, nest)
  # how can I know if something has been nested 4 times?

  # binding.pry
  return pair if pair.is_a? Integer

  if nest == 1

  end

  if nest == 2

  end

  if nest == 3
    if pair[1].is_a? Array
      value, data = explode(pair[1], nest + 1)
      return [pair[0] + data[:left], value]
    end

    if pair[0].is_a? Array
      value, data = explode(pair[0], nest + 1)
      return [value , pair[1] + data[:right]]
    end
  end

  if nest == 4
    return [0, {left: pair[0], right: pair[1] } ]
  end


  [explode(pair[0], nest + 1), explode(pair[1], nest + 1)]
end
