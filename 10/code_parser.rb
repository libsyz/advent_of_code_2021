

def line_checker(line)
  braces = ["[]", "{}", "()", "<>"]

  closers = /\}|\>|\]|\)/

  loop do
    length = line.length

    braces.each do |br|
      line.gsub!(br, '')
    end

    break if line.length == length
  end

  return line[line =~ closers] if line =~ closers
end
