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
    output[:length_id] = bin[6].to_i
    slices = bin[6] == '0' ? 15 : 11
    output[:subpackets] = bin[7..-1].scan(/.{#{slices}}/).length - 1
  end

  output




end
