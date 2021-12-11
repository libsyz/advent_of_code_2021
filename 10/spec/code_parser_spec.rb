require 'rspec'
require 'pry-byebug'
require_relative '../code_parser.rb'

describe '#syntax_error_score' do
  input = [
          "[({(<(())[]>[[{[]{<()<>>",
          "[(()[<>])]({[<{<<[]>>(",
          "{([(<{}[<>[]}>{[]{[(<()>",
          "(((({<>}<{<{<>}{[]{[]{}",
          "[[<[([]))<([[{}[[()]]]",
          "[{[{({}]{}}([{[{{{}}([]",
          "{<[[]]>}<{[{[{[]{()[[[]",
          "[<(<(<(<{}))><([]([]()",
          "<{([([[(<>()){}]>(<<{{",
          "<{([{{}}[<[[[<>{}]]]>[]]"
        ]

  it 'computes the right score for the test input' do
    res = syntax_error_score(input)
    expect(res).to eq(26397)
  end

end


describe '#line_checker' do
  context 'with valid lines' do
    it 'returns nil with a complete line' do
      valid_line = "[({(<(())[]>[[{[]{<()<>>"
      res = line_checker(valid_line)
      expect(res).to eq(nil)
    end

    it 'returns nil with an incomplete line' do
      valid_line = "[[[[[["
      res = line_checker(valid_line)
      expect(res).to eq(nil)
    end
  end

  context 'with invalid lines' do
    it 'returns the first invalid character' do
      invalid_line = '{([(<{}[<>[]}>{[]{[(<()>'
      res = line_checker(invalid_line)
      expect(res).to eq('}')
    end

    it 'returns the first invalid character' do
      invalid_line = '[[<[([]))<([[{}[[()]]]'
      res = line_checker(invalid_line)
      expect(res).to eq(')')
    end
  end
end

describe "#line_closer" do
  context 'an open line' do
    it 'returns the correct closing sequence' do
      res = line_closer('[({(<(())[]>[[{[]{<()<>>')
      expect(res).to eq('}}]])})]')
    end

    it 'returns the correct closing sequence' do
      res = line_closer('[(()[<>])]({[<{<<[]>>(')
      expect(res).to eq(')}>]})')
    end

    it 'returns the correct closing sequence' do
      res = line_closer('{<[[]]>}<{[{[{[]{()[[[]')
      expect(res).to eq(']]}}]}]}>')
    end
  end

end
