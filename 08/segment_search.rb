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
  references = {}
  entries = input[:entry][:signal_patterns]
  references[:one] = entries.find { |str| str.length == 2 }
  references[:four] = entries.find { |str| str.length == 4 }
  references[:seven] = entries.find { |str| str.length == 3 }
  references[:eight] = entries.find { |str| str.length == 7 }

  references
end
