require 'rspec'
require './../binary_diagnostic.rb'

describe "#binary_diagnostic" do
  context "with data from Advent of Code" do
    it "calculates the right epsilon, gamma, oxygen and co two rates" do
      data = ['00100',
              '11110',
              '10110',
              '10111',
              '10101',
              '01111',
              '00111',
              '11100',
              '10000',
              '11001',
              '00010',
              '01010']
      res = binary_diagnostic(data)
      # '2503197'
      expect(res[:gamma]).to eq('10110')
      expect(res[:gamma].to_i(2)).to eq(22)
      expect(res[:epsilon]).to eq('01001')
      expect(res[:epsilon].to_i(2)).to eq(9)
      expect(res[:oxygen]).to eq('10111')
      expect(res[:oxygen].to_i(2)).to eq(23)
      expect(res[:co_two]).to eq('01010')
      expect(res[:co_two].to_i(2)).to eq(10)
    end


  end

end
