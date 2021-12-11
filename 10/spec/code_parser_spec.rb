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


describe "#closing_calculator" do
  context 'with valid closings' do
    it 'returns the correct score' do
      res = closing_calculator('}}]])})]')
      expect(res).to eq(288957)
    end

    it 'returns the correct score' do
      res = closing_calculator(')}>]})')
      expect(res).to eq(5566)
    end

    it 'returns the correct closing sequence' do
      res = closing_calculator('}}>}>))))')
      expect(res).to eq(1480781)
    end

    it 'returns the correct closing sequence' do
      res = closing_calculator(']]}}]}]}>')
      expect(res).to eq(995444)
    end

    it 'returns the correct closing sequence' do
      res = closing_calculator('])}>')
      expect(res).to eq(294)
    end
  end

  describe "#final_score" do
    context "with a set of scores" do
      it 'gets the middle score out of the set' do
        scores = [288957, 5566, 1480781, 995444, 294]
        res = final_score(scores)
        expect(res).to eq(288957)
      end

    end


  end


end
