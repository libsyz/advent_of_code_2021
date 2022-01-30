require 'pry-byebug'

def snail_add(first, second)
  [first, second]
end


def explode(pair, nest)
  # how can I know if something has been nested 4 times?

  # binding.pry
  return pair if pair.is_a? Integer

  if nest == 3
    if pair[1].is_a? Array
      return [pair[0] + pair[1][0], explode(pair[1], nest + 1)]
    end

    if pair[0].is_a? Array
      return [explode(pair[0], nest + 1), pair[1] + pair[0][1] ]
    end
  end

  if nest == 4
    return 0
  end


  [explode(pair[0], nest + 1), explode(pair[1], nest + 1)]
end
