

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
