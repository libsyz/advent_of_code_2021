
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
