
require 'rspec'
require_relative '../packet_decoder'

describe "#hex_to_bin" do
  context "with hexadecimal string input" do
    it "converts a hexadecimal number into binary" do
      res = hex_to_bin('D2FE28')
      expect(res).to eq('110100101111111000101000')
    end
  end
end

describe "#binary_representation" do
  context "with a packet containing literal values" do
    it "returns 2021 for packet D2FE28 - 110100101111111000101000" do
      res = binary_representation("110100101111111000101000")
      expect(res).to eq('011111100101')
      expect(res.to_i(2)).to eq(2021)
    end
  end
end

describe "#unpack" do
  context "with a packet containing a length id of 0" do
    it "returns two subpackets for EE00D40C823060" do
      subpackets = '0000000000110111101000101001010010001001000000000'
      res = unpack(subpackets, :zero)
      expect(res).to eq(['11010001010', '0101001000100100')
    end
  end

  context "with a packet containing a length id of 1" do
  end

end
