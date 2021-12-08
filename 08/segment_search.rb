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




def decode(input)
  positions = { a: nil, b: nil, c: nil, d: nil, e: nil, f: nil, g: nil }
  numbers = {}
  entries = input[:entry][:signal_patterns]

  # get numbers for numbers with unique number of activated numbers
  numbers[:one] = entries.find { |str| str.length == 2 }
  numbers[:four] = entries.find { |str| str.length == 4 }
  numbers[:seven] = entries.find { |str| str.length == 3 }
  numbers[:eight] = entries.find { |str| str.length == 7 }
  # fun begins here


  positions[:a] = get_a(numbers)
  positions[:d] = get_d(entries)
  # position[:f] = get_f(entries, numbers[:four], positions[:a] )


  numbers[:zero] = entries.find { |str| str.length == 6 && !str.include?(positions[:d] )}
  numbers[:nine] = entries.find{ |str| str.length == 6 && (numbers[:four].chars - str.chars).empty? }
  numbers[:six] = entries.find { |str| str.length == 6 && str != numbers[:zero] && str != numbers[:nine] }
  numbers[:three] = entries.find { |str| str.length == 5 && (numbers[:seven].chars - str.chars).empty? }
  numbers[:five] = entries.find { |str| str.length == 5 && (str.chars - numbers[:six].chars).empty? }
  numbers[:two] = entries.find { |str| str.length == 5 && str != numbers[:five] && str != numbers[:three] }
  numbers
end

def get_a(numbers)
  numbers[:seven].chars - numbers[:one].chars
end

def get_d(entries)
  possibles = entries.select { |str| str.length == 5 || str.length == 4 }
  chars = possibles.join.split('').uniq.join
  b = chars.chars.find { |c| possibles.all? {  |ps| ps.include? c } }
end

def get_f(entries, four, pos_a)
  # position a + four gives you (9 - 1 position)
  # the position missing is f

end
