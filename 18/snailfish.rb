

def snail_add(first, second)
  [first, second]
end


def explode(arr)
  # how can I know if something has been nested 4 times?
  arr.each_with_index do |el, idx|

    nest = 0
    el = nil

    until el.class == Integer
      el ? ( el = el[0] ) : ( el = arr[0] )
      nest += 1
    end

    p nest
    if nest == 3
      p "explodable found at idx #{idx}"
    end

  end

end
