require './../sonar'
require 'rspec'

describe '#sonar' do
  it '#counts the number of times the depth increases' do
    measurements = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]
    counts = sonar(measurements)
    expect(counts).to eq(7)
  end
end
