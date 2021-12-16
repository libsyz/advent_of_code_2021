require 'rspec'
require '../polymer.rb'

describe "#polymerize!" do
  context "with a starting polymer" do
    let(:polymer) { 'NNCB' }
    xit "returns the right polymer after 1 step" do
      res = polymerize!(polymer)
      expect(res).to eq('NCNBCHB')
    end

    xit "returns the right polymer after 2 steps" do
      res = polymerize!(polymer, steps: 2)
      expect(res).to eq('NBCCNBBBCBHCB')
    end

    xit "returns the right polymer after 3 steps" do
      res = polymerize!(polymer, steps: 3)
      expect(res).to eq('NBBBCNCCNBBNBNBBCHBHHBCHB')
    end

    xit "returns the right polymer after 4 steps" do
      res = polymerize!(polymer, steps: 4)
      expect(res).to eq('NBBNBNBBCCNBCNCCNBBNBBNBBBNBBNBBCBHCBHHNHCBBCBHCB')
    end

    it "returns the right polymer length after 1 step" do
      res = polymerize!(polymer)
      expect(res.values.sum).to eq(7)
    end

    xit "returns the right polymer after 2 steps" do
      res = polymerize!(polymer, steps: 2)
      expect(res.length).to eq(13)
    end

    it "returns a polymer with the right length after 5 steps" do
      res = polymerize!(polymer, steps: 5)
      expect(res.values.sum).to eq(97)
    end

    it "returns a polymer with the right component count after 10 steps" do
      # After step 10, B occurs 1749 times, C occurs 298 times, H occurs 161 times, and N occurs 865 times
      res = polymerize!(polymer, steps: 10)
      expect(res['B']).to eq(1749)
      expect(res['C']).to eq(298)
      expect(res['H']).to eq(161)
      expect(res['N']).to eq(865)
    end





  end

end
