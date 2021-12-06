
require 'rspec'
require_relative '../lanterns.rb'

describe "#lanterns" do
  initial_state = [3,4,3,1,2]
  context "part one - model the growth rate of the lantern fish" do
    it 'after 1 day' do
      res = lanterns(initial_state, days: 1)
      calc = lanterns_hash(initial_state, days: 1)
      expect(res).to eq([2,3,2,0,1])
      expect(calc).to eq(5)
    end

    it 'after 2 days' do
      res = lanterns(initial_state, days: 2)
      expect(res).to eq([1,2,1,6,0,8])
      calc = lanterns_hash(initial_state, days: 2)
      expect(calc).to eq(6)
    end

    it 'after 3 days' do
      res = lanterns(initial_state, days: 3)
      expect(res).to eq([0,1,0,5,6,7,8])
    end

    it 'after 4 days' do
      res = lanterns(initial_state, days: 4)
      expect(res).to eq([6,0,6,4,5,6,7,8,8])
    end

    it 'after 5 days' do
      res = lanterns(initial_state, days: 5)
      expect(res).to eq([5,6,5,3,4,5,6,7,7,8])
    end


    it 'after 6 days' do
      res = lanterns(initial_state, days: 6)
      expect(res).to eq([4,5,4,2,3,4,5,6,6,7])
    end

    it 'after 7 days' do
      res = lanterns(initial_state, days: 7)
      expect(res).to eq([3,4,3,1,2,3,4,5,5,6])
    end

    it 'after 8 days' do
      res = lanterns(initial_state, days: 8)
      expect(res).to eq([2,3,2,0,1,2,3,4,4,5])
    end


    it 'after 9 days' do
      res = lanterns(initial_state, days: 9)
      expect(res).to eq([1,2,1,6,0,1,2,3,3,4,8])
    end

    it 'after 10 days' do
      res = lanterns(initial_state, days: 10)
      expect(res).to eq([0,1,0,5,6,0,1,2,2,3,7,8])
      calc = lanterns_hash(initial_state, days: 10)
      expect(calc).to eq(12)
    end

    it 'after 11 days' do
      res = lanterns(initial_state, days: 11)
      expect(res).to eq([6,0,6,4,5,6,0,1,1,2,6,7,8,8,8])
    end

    it 'after 12 days' do
      res = lanterns(initial_state, days: 12)
      expect(res).to eq([5,6,5,3,4,5,6,0,0,1,5,6,7,7,7,8,8])
    end


    it 'after 13 days' do
      res = lanterns(initial_state, days: 13)
      expect(res).to eq([4,5,4,2,3,4,5,6,6,0,4,5,6,6,6,7,7,8,8])
    end

    it 'after 14 days' do
      res = lanterns(initial_state, days: 14)
      expect(res).to eq([3,4,3,1,2,3,4,5,5,6,3,4,5,5,5,6,6,7,7,8])
    end

    it 'after 15 days' do
      res = lanterns(initial_state, days: 15)
      expect(res).to eq([2,3,2,0,1,2,3,4,4,5,2,3,4,4,4,5,5,6,6,7])
    end

    it 'after 16 days' do
      res = lanterns(initial_state, days: 16)
      expect(res).to eq([1,2,1,6,0,1,2,3,3,4,1,2,3,3,3,4,4,5,5,6,8])
    end

    it 'after 17 days' do
      res = lanterns(initial_state, days: 17)
      expect(res).to eq([0,1,0,5,6,0,1,2,2,3,0,1,2,2,2,3,3,4,4,5,7,8])
    end

    it 'after 18 days' do
      res = lanterns(initial_state, days: 18)
      expect(res).to eq([6,0,6,4,5,6,0,1,1,2,6,0,1,1,1,2,2,3,3,4,6,7,8,8,8,8])
    end

    it 'after 80 days gets the right number of lanternfish' do
      res = lanterns(initial_state, days: 80)
      expect(res.length).to eq(5934)
      calc = lanterns_hash(initial_state, days: 80)
      expect(calc).to eq(5934)
    end

    it 'after 256 days gets the right number of lanternfish' do
      calc = lanterns_hash(initial_state, days: 256)
      expect(calc).to eq(26984457539)
    end

  end


end
