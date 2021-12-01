require 'pry-byebug'
measurements = []
File.open('./input.txt').each do |line|
  measurements << line.chomp.to_i
end


def sonar(measurements)
  previous = nil
  increases = 0
  measurements.each do |num|
    if previous && previous < num
      increases += 1
    end
    previous = num
  end
  increases
end

# Your goal now is to count the number of times the sum of measurements in this sliding window increases from the previous sum.
# So, compare A with B, then compare B with C, then C with D, and so on.
# Stop when there aren't enough measurements left to create a new three-measurement sum.



def sonar_sliding(measurements)

  sums = measurements.map.with_index do |el, index|
    if measurements[index + 1] && measurements[index + 2]
      el + measurements[index + 1] + measurements[index + 2]
    end
  end.compact
  sonar(sums)
end

p sonar_sliding(measurements)
