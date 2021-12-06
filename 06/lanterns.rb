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

def lanterns(state, days:)
  lantern_pond = LanternPond.new(state)
  (1..days).each do

    lantern_pond.day_pass!
  end
  lantern_pond.to_a
end
