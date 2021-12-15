require 'rspec'
require '../polymer.rb'

describe "#polymerize!" do
  context "with a starting polymer" do
    let(:polymer) { 'NNCB' }
    it "returns the right polymer after 1 step" do
      res = polymerize!(polymer)
      expect(res).to eq('NCNBCHB')
    end

    it "returns the right polymer after 2 steps" do
      res = polymerize!(polymer, steps: 2)
      expect(res).to eq('NBCCNBBBCBHCB')
    end

    it "returns the right polymer after 3 steps" do
      res = polymerize!(polymer, steps: 3)
      expect(res).to eq('NBBBCNCCNBBNBNBBCHBHHBCHB')
    end

    it "returns the right polymer after 4 steps" do
      res = polymerize!(polymer, steps: 4)
      expect(res).to eq('NBBNBNBBCCNBCNCCNBBNBBNBBBNBBNBBCBHCBHHNHCBBCBHCB')
    end

    it "returns a polymer with the right length after 5 steps" do
      res = polymerize!(polymer, steps: 5)
      expect(res.length).to eq(97)
    end

    it "returns a polymer with the right component count after 10 steps" do
      # After step 10, B occurs 1749 times, C occurs 298 times, H occurs 161 times, and N occurs 865 times
      res = polymerize!(polymer, steps: 10)
      expect(res.count('B')).to eq(1749)
      expect(res.count('C')).to eq(298)
      expect(res.count('H')).to eq(161)
      expect(res.count('N')).to eq(865)
    end





  end

end
