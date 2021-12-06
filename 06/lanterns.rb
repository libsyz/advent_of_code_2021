require 'pry-byebug'

class LanternFish
  attr_reader :maturity

  def initialize(maturity, pond)
    @maturity = maturity
    @pond = pond
  end

  def mature!
    @maturity -= 1
    if @maturity.negative?
      @maturity = 6
      @pond.state << LanternFish.new(9, @pond)
    end
  end
end


class LanternPond
  attr_reader :state

  def initialize(state)
    @state = state.map { |n| LanternFish.new(n, self)}
  end

  def day_pass!
    @state.each do |lfish|
      #binding.pry if lfish.maturity.zero?
      lfish.mature!
    end
  end

  def to_a
    @state.map { |lfish| lfish.maturity }
  end
end

STATE = [3,4,3,1,2,1,5,1,1,1,1,4,1,2,1,1,2,1,1,1,3,4,4,4,1,3,2,1,3,4,1,1,3,4,2,5,5,3,3,3,5,1,4,1,2,3,1,1,1,4,1,4,1,5,3,3,1,4,1,5,1,2,2,1,1,5,5,2,5,1,1,1,1,3,1,4,1,1,1,4,1,1,1,5,2,3,5,3,4,1,1,1,1,1,2,2,1,1,1,1,1,1,5,5,1,3,3,1,2,1,3,1,5,1,1,4,1,1,2,4,1,5,1,1,3,3,3,4,2,4,1,1,5,1,1,1,1,4,4,1,1,1,3,1,1,2,1,3,1,1,1,1,5,3,3,2,2,1,4,3,3,2,1,3,3,1,2,5,1,3,5,2,2,1,1,1,1,5,1,2,1,1,3,5,4,2,3,1,1,1,4,1,3,2,1,5,4,5,1,4,5,1,3,3,5,1,2,1,1,3,3,1,5,3,1,1,1,3,2,5,5,1,1,4,2,1,2,1,1,5,5,1,4,1,1,3,1,5,2,5,3,1,5,2,2,1,1,5,1,5,1,2,1,3,1,1,1,2,3,2,1,4,1,1,1,1,5,4,1,4,5,1,4,3,4,1,1,1,1,2,5,4,1,1,3,1,2,1,1,2,1,1,1,2,1,1,1,1,1,4]

# def lanterns(state, days:)
#   lantern_pond = LanternPond.new(state)
#   (1..days).each do |n|

#     lantern_pond.day_pass!
#   end
#   lantern_pond.to_a
# end


def lanterns_hash(state, days:)

  lantern_fish = {
    0 => { current: 0, received: 0 },
    1 => { current: 0, received: 0 },
    2 => { current: 0, received: 0 },
    3 => { current: 0, received: 0 },
    4 => { current: 0, received: 0 },
    5 => { current: 0, received: 0 },
    6 => { current: 0, received: 0 },
    7 => { current: 0, received: 0 },
    8 => { current: 0, received: 0 }
  }

  state.each do |num|
    lantern_fish[num][:current] += 1
  end

  days.times do
    # binding.pry
    8.downto(0) do |n|
      # update receives, clear currents
      if n == 0
        lantern_fish[8][:received] += lantern_fish[0][:current]
        lantern_fish[6][:received] += lantern_fish[0][:current]
        lantern_fish[0][:current] = 0
      else
        lantern_fish[n - 1][:received] += lantern_fish[n][:current]
        lantern_fish[n][:current] = 0
      end

    end

    # update currents, clear received

    8.downto(0) do |n|
      lantern_fish[n][:current] = lantern_fish[n][:received]
      lantern_fish[n][:received] = 0
    end
  end

  lantern_fish.values.sum { |v| v[:current] }
end

p lanterns_hash(STATE, days: 256)
