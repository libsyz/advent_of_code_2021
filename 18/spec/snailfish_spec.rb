
require 'rspec'
require_relative '../snailfish.rb'

describe '#snail_add' do
  context 'with two basic numbers' do
    let(:first) { [1,2] }
    let(:second) { [[3,4],5] }

    it 'returns a nested array that appends the first before the second' do
      res = snail_add(first, second)
      expect(res).to eq([[1,2],[[3,4],5]])
    end
  end
end

describe "#explode" do
  context "with an explodable element at the beginning of the array" do
    let(:arr) { [[[[[1, 1], [2, 2]], [3, 3]], [4, 4]], [5, 5]] }
    it 'returns a pair and does not enter a loop!' do
      res = explode(arr, 0)
      expect(res.class).to eq Array
    end
  end

  context 'with an explodable element at the beginning of the array' do
    let(:arr) { [[[[[9,8],1],2],3],4] }
    it 'explodes properly' do
      res = explode(arr, 0)
      expect(res).to eq([[[[0,9],2],3],4])
    end
  end

  context 'with an explodable element at the end of the array' do
    let(:arr) { [7,[6,[5,[4,[3,2]]]]] }
    it 'explodes properly' do
      res = explode(arr, 0)
      expect(res).to eq([7,[6,[5,[7,0]]]])
    end
  end

  context 'with two deeply wrapped pairs' do
    let(:arr) { [ [3,[2,[1,[7,3]]]],[6,[5,[4,[3,2]]]] ] }
    it 'explodes properly' do
      res = explode(arr, 0)
      expect(res).to eq([[3,[2,[8,0]]],[9,[5,[7,0]]]])
    end
  end

  context "with an element that needs to explode both left and right" do
    let(:arr) { [[6,[5,[4,[3,2]]]],1] }
    it 'explodes properly' do
      res = explode(arr, 0)
      expect(res).to eq([[6,[5,[7,0]]],3])
    end
  end
end

describe "#split_pair" do
  context 'with a pair with two splitable pairs' do
    let(:pair) { [[[[0,7],4],[15,[0,13]]],[1,1]] }
    it 'splits the pair correctly' do
      res = split_pair(pair)
      expect(res).to eq([[[[0,7],4],[[7,8],[0,[6,7]]]],[1,1]])
    end
  end
end

describe '#split' do
  context 'with number below 10' do
    let(:five) { 5 }
    let(:nine) { 9 }
    it 'returns the same number' do
      res = split(five)
      expect(res).to eq(5)

      res = split(nine)
      expect(res).to eq(9)
    end
  end

  context "with numbers above 10" do
    context 'with an odd integer' do
      let(:thirteen) { 13 }
      let(:fifteen) { 15 }
      it 'returns the small part of the division at the beginning of the array' do
        res = split(thirteen)
        expect(res).to eq([6,7])

        res = split(fifteen)
        expect(res).to eq([7,8])
      end
    end

    context 'with an even integer' do
      let(:fourteen) { 14 }
      let(:eighteen) { 18 }
      it 'returns an evenly split array' do
        res = split(fourteen)
        expect(res).to eq([7,7])

        res = split(eighteen)
        expect(res).to eq([9,9])
      end
    end
  end
end

describe "#calculate" do
  context "with a set of simple, non nested pairs that will not explode" do
    let(:pairs) { [[1,1], [2,2], [3,3], [4,4]] }
    it 'calculates the right sum' do
      res = calculate(pairs)
      expect(res).to eq([[[[1,1],[2,2]],[3,3]],[4,4]])
    end
  end

  context "with a set of simple, non nested pairs that will explode" do
    let(:pairs) { [[1,1], [2,2], [3,3], [4,4], [5,5]] }
    it 'calculates the right sum' do
      res = calculate(pairs)

      expect(res).to eq([[[[3,0],[5,3]],[4,4]],[5,5]])
    end
  end

end
