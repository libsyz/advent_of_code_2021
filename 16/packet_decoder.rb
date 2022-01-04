require 'pry-byebug'

def hex_to_bin(hex)
  key = { '0' => '0000',
          '1' => '0001',
          '2' => '0010',
          '3' => '0011',
          '4' => '0100',
          '5' => '0101',
          '6' => '0110',
          '7' => '0111',
          '8' => '1000',
          '9' => '1001',
          'A' => '1010',
          'B' => '1011',
          'C' => '1100',
          'D' => '1101',
          'E' => '1110',
          'F' => '1111'}

  hex.split('').map { |el| key[el] }.join
end


def decode(hex)
  output = {}
  bin = hex_to_bin(hex)
  # binding.pry
  output[:version] = bin[0..2].to_i(2)
  output[:type_id] = bin[3..5].to_i(2)

  if output[:type_id] != 4

    output[:length_id] = bin[6]
    if output[:length_id] == '0'

      binding.pry
      # get the bytes from 7..21
      # start parsing packages
      # how do I know if package has finished?
    else
    end
  end

  output




end


def binary_representation(literal)
  rep = literal[6..-1]
  values = ''

  loop do
    group = rep.slice!(0..4)
    if group[0] == '1'
      values += group[1..-1]
    else # reached the end
      values += group[1..-1]
      break
    end
  end

  values
end
