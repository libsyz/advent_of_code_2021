
crabs = [16,1,2,0,4,2,7,1,2,14]

def align(crabs)
  costs = {} #{ position: sum_of_moving_all_crabs }
  crabs.each_with_index do |crab, idx|
    next if costs[crab]
    costs[crab] = crabs.sum { |val| (crab - val).abs }
  end
  costs
end

p align(crabs)
