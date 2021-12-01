require './../sonar'
require 'rspec'

describe '#sonar' do
  context "when the measurements are always different from each other" do
    it '#correctly counts the number of times the depth increases' do
      measurements = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]
      counts = sonar(measurements)
      expect(counts).to eq(7)
    end
  end

  context "when the measurements always increase" do
    it '#correctly counts the number of times the depth increases' do
      measurements = [199, 200, 201, 202, 203, 204, 205, 206, 207, 208]
      counts = sonar(measurements)
      expect(counts).to eq(measurements.length - 1)
    end
  end

  context "when the measurements always decrease" do
    it '#tallies the counts of depth increases to 0' do
      measurements = [208, 207, 206, 205, 204, 203, 202, 201, 200, 199]
      counts = sonar(measurements)
      expect(counts).to eq(0)
    end
  end

  context "when the measurements sometimes stay the same" do
    it '#correctly counts the amount of depth increases' do
      measurements = [100, 100, 100, 101, 100]
      counts = sonar(measurements)
      expect(counts).to eq(1)
    end
  end
end

describe "#sonar_sliding" do
  context "when the measurements are always different from each other" do
    it '#correctly counts the number of times the depth increases' do
      measurements = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]
#                     A   A    A    607
#                         B    B    B    618
#                              C    C    C    618
#                                   D    D    D    647
#                                        E    E    E   716
#                                             F    F   F  769
#                                                  G   G  G  792
#                                                      H  H  H
#                                                            Stop

      counts = sonar_sliding(measurements)
      expect(counts).to eq(5)
    end
  end

  context "when the measurements always increase" do
    it '#correctly counts the number of times the depth increases' do
      measurements = [199, 200, 201, 202, 203, 204, 205, 206, 207, 208]

      counts = sonar_sliding(measurements)
      expect(counts).to eq(7)
    end
  end

  context "when the measurements always decrease" do
    it '#correctly counts the number of times the depth increases' do
      measurements = [208, 207, 206, 205, 204, 203, 202, 201, 200, 199]

      counts = sonar_sliding(measurements)
      expect(counts).to eq(0)
    end
  end

  context "when the measurements sometimes stay the same" do
    it '#correctly counts the number of times the depth increases' do
      measurements = [100, 100, 100, 101, 100]

      counts = sonar_sliding(measurements)
      expect(counts).to eq(1)
    end
  end
end
