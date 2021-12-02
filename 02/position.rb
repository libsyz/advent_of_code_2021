# require 'pry-byebug'
# commands = []
# File.open('./input.txt').each do |line|
#   # binding.pry
#   command, num = line.chomp.split
#   commands << [command.to_sym, num.to_i]
# end

def position(commands)
  pos = { horizontal: 0, vertical: 0}
  commands.each do |cmd|
    case cmd[0]
    when :up
      pos[:vertical] -= cmd[1]
    when :down
      pos[:vertical] += cmd[1]
    when :forward
      pos[:horizontal] += cmd[1]
    else
      # no op
    end
  end
  pos
end


def position_with_aim(commands)
  pos = { horizontal: 0, vertical: 0, aim: 0}
  commands.each do |cmd|
    case cmd[0]
    when :up
      pos[:aim] -= cmd[1]
    when :down
      pos[:aim] += cmd[1]
    when :forward
      pos[:horizontal] += cmd[1]
      pos[:vertical] += (pos[:aim] * cmd[1])
    else
      # no op
    end
  end
  pos
end
# p position(commands)
