
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
