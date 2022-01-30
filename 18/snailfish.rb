require 'pry-byebug'

def snail_add(first, second)
  [first, second]
end


def explode(arr, nest)
  # binding.pry
  # how can I know if something has been nested 4 times?
  arr.each_with_index do |el, idx|
    # do I have a pair?
    dive = nil
    if el.is_a?(Array)
      dive = explode(el, nest + 1)

      if !dive[:left_added] && !idx.zero?
        binding.pry
        arr[idx - 1] += dive[:left]
        dive[:left_added] = true
      end

      if !dive[:right_added] && arr[idx + 1]
        arr[idx - 1] += dive[:right]
        dive[:right_added] = true
      end

      arr[idx] = dive[:swap_value] if (nest + 1) == 4

    end

    if nest == 4
      return { swap_value: 0, left: arr[0], right: arr[1], left_added: false, right_added: false }
    end
  end

  if nest.zero?
    arr
  end

  return dive
end

 p explode([7,[6,[5,[4,[3,2]]]]], 0)

 p explode([[[[[9,8],1],2],3],4], 0)
