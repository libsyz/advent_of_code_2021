require 'rspec'
require_relative '../position.rb'


describe "#position" do
  context "with data from AoC example" do
    commands = [
                [:forward, 5],
                [:down, 5],
                [:forward, 8],
                [:up, 3],
                [:down, 8],
                [:forward, 2]
              ]
    it "calculates the right total positions" do
      res = position(commands)
       expect(res[:horizontal]).to eq(15)
       expect(res[:vertical]).to eq(10)
       expect(res[:horizontal] * res[:vertical]).to eq(150)
    end
  end
end


describe "#position_with_aim" do
  context "with data from AoC example" do
    commands = [
                [:forward, 5],
                [:down, 5],
                [:forward, 8],
                [:up, 3],
                [:down, 8],
                [:forward, 2]
              ]
    it "calculates the right total positions" do
      res = position(commands)
       expect(res[:horizontal]).to eq(15)
       expect(res[:vertical]).to eq(60)
       expect(res[:horizontal] * res[:vertical]).to eq(900)
    end
  end
end
