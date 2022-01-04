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

def unpack(data, mode:)
  if mode == :zero
    # get the length of the bits in the packages
    subpackages_length = data[0..14].to_i(2)
    subpackages = packages[15..subpackages_length - 1]
  end
end


def decode(packet, length=0)
  packet_version = packet[0..2].to_i(2)
  packet_type = packet[3..5].to_i(2)
  length += 6
  packet_value = ''
  #base case
  if packet_type == 4
    remaining = packet[6..-1]
    loop do
      if remaining[0] == '0'
        packet_value += remaining[1..4]
        remaining = remaining[5..-1]
        length += 5
        break
      end
    packet_value += remaining[1..4]
    remaining = remaining[5..-1]
    length += 5
  end
  packet_value = packet_value.to_i(2)
  else
    type_id = packet[6]
    remaining = packet[7..-1]
    length += 1
    if type_id == '0'
      total_length = remaining[0..14].to_i(2)
      remaining = remaining[15..-1]
      length += 15
      sub_packet_length = 0
      values = []
      while sub_packet_length != total_length
        remaining, sub_packet_length, value = decode(remaining, sub_packet_length)
        values << value
      end
      length += sub_packet_length
    elsif type_id == '1'
      total_count = remaining[0..10].to_i
      remaining = remaining[11..-1]
      length += 11
      sub_packet_length = 0
      count = 0
      values = []
      while count != total_count
        remaining, sub_packet_length, value = decode(remaining, sub_packet_length)
        values << value
        count += 1
      end
      length += sub_packet_length
    end
  end
  return [remaining, length, packet_value]
end


p decode(hex_to_bin('8A004A801A8002F478'))
