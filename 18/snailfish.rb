require 'pry-byebug'

def snail_add(first, second)
  [first, second]
end


def explode(arr, nest)
  # binding.pry
  # how can I know if something has been nested 4 times?
  arr.each_with_index do |el, idx|
    # do I have a pair?
    if el.is_a?(Array)
      swap = explode(el, nest + 1)

      arr[idx] = swap[0] if (nest + 1) == 4
    end

    if nest == 4
      return [0, arr[0], arr[1]]
    end
  end


  arr
end

 p explode([7,[6,[5,[4,[3,2]]]]], 0)

 p explode([[[[[9,8],1],2],3],4], 0)
