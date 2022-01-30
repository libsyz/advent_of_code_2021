require 'pry-byebug'

def snail_add(first, second)
  [first, second]
end


def explode(arr)
  # how can I know if something has been nested 4 times?
  arr.each_with_index do |el, idx|
    nesting = 0
    until el.class == Integer
      el ? ( el = el[0] ) : ( el = arr[0] )
      nesting += 1
    end

    if nesting == 4
      # binding.pry
      p "explodable found at idx #{idx}"
      left, right = arr[idx][0][0][0]
      arr[idx][0][0][0] = 0
      arr[idx][0][0][1] += right
    end
  end

  arr
end

p explode([[[[[9,8],1],2],3],4])
#=> [[[[0,9],2],3],4]
