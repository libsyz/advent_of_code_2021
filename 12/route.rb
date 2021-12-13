@nodes = [['start','A'],
         ['start','b']
         ['A','c'],
         ['A','b'],
         ['b','d'],
         ['A','end'],
         ['b','end']]

def possibles(candidate, candidates)
  # look at the last node in my candidate

  # if it has an end, I'm done

  # if it has anything else, look for something with an
  # end that closes

  # if the solution is already there, we need a
  # new one in the candidates, if possible

  #
end

def solve!(arr)
  candidates = []
  # find the starting nodes
  starts = @nodes.select { |nd| nd.include? 'start' }

  # iterate through the starting nodes
  starts.each_with_index do |stnd, idx|
    candidates = possibles([stnd], candidates)
    until candidates != candidates.uniq!
      candidates.each do |candidate|
        candidates = possibles(candidate, candidates)
      end
    end
  end
end

p arr
