
require_relative '../crab.rb'
require 'rspec'


describe "#crab" do
  context "part 1" do
    crabs = [16,1,2,0,4,2,7,1,2,14]
    it 'calculates the minimum amount fuel possible to align all crabs in the same position' do
      res = align(crabs)
      expect(res).to eq(14)
    end
  end
end
