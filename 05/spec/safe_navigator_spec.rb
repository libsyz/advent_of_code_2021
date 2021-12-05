require_relative '../safe_navigator.rb'
require 'rspec'

describe "'#safe_navigator" do
  data = [
          [[0,9],[5,9]],
          [[8,0],[0,8]],
          [[9,4],[3,4]],
          [[2,2],[2,1]],
          [[7,0],[7,4]],
          [[6,4],[2,0]],
          [[0,9],[2,9]],
          [[3,4],[1,4]],
          [[0,0],[8,8]],
          [[5,5],[8,2]]
        ]
  context "part 1 - detects hydrothermal vents straight lines" do
    it "returns the correct number of points with more than 1
    hydrothermal vent" do
      res = safe_navigator(data)
      expect(res).to eq 5
    end

  end

  context "part 2 - " do

  end
end

describe '#is_diagonal?' do
  describe 'detects pair points that draw a 45 degree diagonal line' do
    context 'with diagonal points' do
      it 'returns true' do
        points = [[1,1],[3,3]]
        res = is_diagonal?(points)
        expect(res).to eq(true)
        points_two = [[9,7], [7,9]]
        res_two = is_diagonal?(points_two)
        expect(res_two).to eq(true)

      end
    end
    context 'with non diagonal points' do
      it 'returns false' do
        points = [[0,1],[3,3]]
        res = is_diagonal?(points)
        expect(res).to eq(false)
      end
    end
  end
end

describe '#expand' do
  describe "expands to points given that their
  one of their x or y axes are the same" do
    context 'with same x' do
      it 'returns the right unpacked points' do
        points = [[1,1], [1,3]]
        res = expand(points)
        expect(res).to eq([ [1,1], [1,2], [1,3] ])
      end
    end

    context 'with same y' do
      it 'returns the right unpacked points' do
        points = [[9,7], [7,7]]
        res = expand(points)
        expect(res).to eq([ [9,7], [8,7], [7,7] ])
      end
    end

    context 'diagonal points' do
      it "returns the right unpacked points" do
        points = [[1,1],[3,3]]
        res = expand(points, diagonal: true)
        expect(res).to eq([[1,1,],[2,2],[3,3]])
        points = [[9,7],[7,9]]
        res = expand(points, diagonal: true)
        expect(res).to eq([[9,7],[8,8],[7,9]])

        points = [[5,5],[10,0]]
        res = expand(points, diagonal: true)
        expect(res).to eq([[5,5],[6,4],[7,3], [8,2], [9,1], [10, 0]])
      end

    end

  end


end
