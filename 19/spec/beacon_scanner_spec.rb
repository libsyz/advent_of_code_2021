require 'rspec'
require_relative '../beacon_scanner'
require_relative 'example_data'

describe "#overlap?" do
  context "with 2d-example requiring 3 overlapping beacons" do
    it "detects three overlapping beacons, returns true" do
      scanner_one = [[0,2], [4,1], [3,3]]
      scanner_two = [[-1,-1], [-5,0], [-2,1]]
      res = overlap?(scanner_one, scanner_two)
      expect(res).to eq(true)
    end
  end
end

describe "#beacon_counter" do
  context "with two scanners" do
    it "detects at least 12 overlapping beacons" do
      scanners = [SCANNER_ZERO, SCANNER_ONE]
      res = beacon_counter(scanners)
      expect(res).to eq(true)
    end
  end
end
