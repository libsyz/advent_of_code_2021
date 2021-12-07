
require_relative '../crab.rb'
require 'rspec'


describe "#crab" do
  context "part 1 - crabs consume 1 fuel per movement" do
    crabs = [16,1,2,0,4,2,7,1,2,14]
    it 'calculates the minimum amount fuel possible to align all crabs in the same position' do
      res = align(crabs)
      expect(res).to eq(37)
    end
  end

  context "part 2 - crabs consume +1 incremental fuel on every movement" do
    crabs = [16,1,2,0,4,2,7,1,2,14]
    it 'calculates the minimum amount fuel possible to align all crabs in the same position' do
      res = align_incremental(crabs)
      expect(res).to eq(168)
    end
  end
end
