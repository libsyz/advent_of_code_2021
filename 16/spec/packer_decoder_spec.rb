
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


describe "#decode" do
  context "with an operator packet with id length 1" do
    it 'gets the version, type id, length id and number of subpackets' do
      result = decode('EE00D40C823060')
      expect(result[:version]).to eq(7)
      expect(result[:type_id]).to eq(3)
      expect(result[:length_id]).to eq(1)
      expect(result[:subpackets]).to eq(3)
    end
  end

  context "with a operator packet with id length 0" do
    it 'gets the version, type id, length id and number of subpackets' do
      result = decode('38006F45291200')
      expect(result[:version]).to eq(1)
      expect(result[:type_id]).to eq(6)
      expect(result[:length_id]).to eq(0)
      expect(result[:subpackets]).to eq(2)
    end
  end


end
