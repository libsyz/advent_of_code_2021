require 'pry-byebug'
# measurements = []
# File.open('./input.txt').each do |line|
#   measurements << line.chomp.to_i
# end


def sonar(measures)
  measures.each_with_index.reduce(0) do |acc, (_, idx)|
    measures[idx] > measures[idx-1] && idx != 0 ? acc += 1 : acc
  end
end



def sonar_sliding(measurements)
  sums = measurements.map.with_index do |el, index|
    if measurements[index + 1] && measurements[index + 2]
      el + measurements[index + 1] + measurements[index + 2]
    end
  end.compact
  sonar(sums)
end

# p sonar_sliding(measurements)
