require 'pry-byebug'

lines = []

File.readlines('input.txt').each do |line|
  lines << line.chomp
end

def line_cleaner!(line)
  braces = ["[]", "{}", "()", "<>"]
  loop do
      length = line.length

      braces.each do |br|
        line.gsub!(br, '')
      end

      break if line.length == length
  end

  line
end

def line_checker(line)
  line = line_cleaner!(line)
  closers = /\}|\>|\]|\)/
  return line[line =~ closers] if line =~ closers
end

CHAR_SCORE = {
  ')' => 3,
  ']' => 57,
  '}' => 1197,
  '>' => 25137
}

MIRROR = {
    '{' => '}',
    '(' => ')',
    '<' => '>',
    '[' => ']'
  }



def syntax_error_score(lines_arr)
  score = 0
  lines_arr.each do |line|

    first_invalid = line_checker(line)
    score += CHAR_SCORE[first_invalid] if first_invalid
  end
  score
end


def line_closer(line)
  line = line_cleaner!(line)
  return if line.empty? || line_checker(line)


  closing = ''
  line.chars.reverse.each do |char|
    closing += MIRROR[char]
  end

  closing
end
