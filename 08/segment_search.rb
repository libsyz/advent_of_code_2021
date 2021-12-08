require 'pry-byebug'

input = []
File.readlines('input.txt').each do |line|

  line = line.chomp
  signal_patterns, outputs = line.split(' | ')
  signal_patterns = signal_patterns.split(' ')
  outputs = outputs.split(' ')
  input << { entry: { signal_patterns: signal_patterns, outputs: outputs }}
end

def easy_segment_search(entries)
#segments
      #number
  easy_numbers = {2 => 1,
   4 => 4,
   3 => 7,
   7 => 8 }


  easy_number_count = 0

  entries.each do |entry|
    entry[:entry][:outputs].each do |sp|
      easy_numbers[sp.length] ? easy_number_count += 1 : nil
    end
  end
  return easy_number_count
end


def hard_segment_search(entries)

  entries.map do |entry|
    dictionary = decode(entry)
    get_joined_number(entry[:entry][:outputs], dictionary)
  end
end


def get_joined_number(outputs, dictionary)
  values = []

  outputs.each do |output|
    values << dictionary.find { |_, v| v.chars.sort == output.chars.sort }[0]
  end
  values.join.to_i
end


def decode(input)
  positions = { a: nil, b: nil, c: nil, d: nil, e: nil, f: nil, g: nil }
  numbers = {}
  entries = input[:entry][:signal_patterns]

  # get numbers for numbers with unique number of activated numbers
  numbers[1] = entries.find { |str| str.length == 2 }
  numbers[4] = entries.find { |str| str.length == 4 }
  numbers[7] = entries.find { |str| str.length == 3 }
  numbers[8] = entries.find { |str| str.length == 7 }
  # fun begins here


  positions[:a] = get_a(numbers)
  positions[:d] = get_d(entries)
  # position[:f] = get_f(entries, numbers[:four], positions[:a] )


  numbers[0] = entries.find { |str| str.length == 6 && !str.include?(positions[:d] )}
  numbers[9] = entries.find{ |str| str.length == 6 && (numbers[4].chars - str.chars).empty? }
  numbers[6] = entries.find { |str| str.length == 6 && str != numbers[0] && str != numbers[9] }
  numbers[3] = entries.find { |str| str.length == 5 && (numbers[7].chars - str.chars).empty? }
  numbers[5] = entries.find { |str| str.length == 5 && (str.chars - numbers[6].chars).empty? }
  numbers[2] = entries.find { |str| str.length == 5 && str != numbers[5] && str != numbers[3] }
  numbers
end

def get_a(numbers)
  numbers[7].chars - numbers[1].chars
end

def get_d(entries)
  possibles = entries.select { |str| str.length == 5 || str.length == 4 }
  chars = possibles.join.split('').uniq.join
  b = chars.chars.find { |c| possibles.all? {  |ps| ps.include? c } }
end


p hard_segment_search(input).sum
