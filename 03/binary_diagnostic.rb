require 'pry-byebug'

data = []
File.open('./input.txt').each do |line|
  data << line.chomp
end

def cull_with_while(indicator_data, flip_flop: true)
  idx = 0
  until indicator_data.length == 1
    transposed_indicator_data = indicator_data.map { |bin| bin.split('') }.transpose.map(&:join)
    zeroes = transposed_indicator_data[idx].count('0')
    ones = transposed_indicator_data[idx].count('1')
    x, y = zeroes > ones ? ['0', '1'] : ['1', '0']
    indicator_data.select! { |i| i[idx] == ( flip_flop ? x : y ) }

    idx += 1
  end

  indicator_data
end


def binary_diagnostic(data)
  oxygen = data.dup
  co_two = data.dup
  res = {}
  gamma = ''
  epsilon = ''
  transposed = data.map { |bin| bin.split('') }.transpose.map(&:join)
  transposed.each_with_index do |col, idx|
    zeroes = col.count('0')
    ones = col.count('1')
    gamma_bit, epsilon_bit = zeroes > ones ? ['0', '1'] : ['1', '0']
    gamma << gamma_bit
    epsilon << epsilon_bit
  end

  oxygen = cull_with_while(oxygen, flip_flop: true) if oxygen.length > 1
  co_two = cull_with_while(co_two, flip_flop: false) if co_two.length > 1

  res[:gamma] = gamma
  res[:epsilon] = epsilon
  res[:oxygen] = oxygen.first
  res[:co_two] = co_two.first
  res
end

# puts res = binary_diagnostic(data)

# puts "gamma-> #{res[:gamma].to_i(2)}"
# puts "epsilon-> #{res[:epsilon].to_i(2)}"
# puts "oxygen-> #{res[:oxygen].to_i(2)}"
# puts "co_two-> #{res[:co_two].to_i(2)}"

# puts "solution-> #{res[:oxygen].to_i(2) * res[:co_two].to_i(2) } "
