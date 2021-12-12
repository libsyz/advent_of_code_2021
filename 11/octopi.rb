require 'pry-byebug'

class Octopus
  attr_reader :row, :pos, :set
  attr_accessor :energy

  def initialize(energy:, row:, pos:, set:)
    @energy = energy
    @row = row
    @pos = pos
    @set = set
    @adjacents = []
    @flashing = false
  end

  def flashing?
    @flashing
  end

  def step!
    @energy += 1
    if @energy == 10
      @energy = 0
      set.flashing_queue << self unless @flashing
      @flashing = true
    end
  end

  def emit_flash
    @adjacents.each(&:step!)
  end

  def set_adjacents!
    @adjacents = set.get_adjacents(row, pos)
  end

end

class OctopiSet
  attr_reader :flashing_queue

  def initialize(arr)
    @octopi = []
    @flashing_queue = []
    make_octopi!(arr)
  end


  def step!
    @octopi.each { |row| row.each(&:step!) }

    until @flashing_queue.empty?
      @flashing_queue[0].emit_flash
      @flashing_queue.delete_at(0)
    end
  end

  def octopi_flashing
    @octopi.flatten.any?(&:flashing?)
  end

  def to_a
    @octopi.map { |row| row.map { |oct| oct.energy }  }
  end

  def get_adjacents(row, pos)
    p "hello!"
    above = row.zero? ? nil : @octopi[row - 1][pos]
    below = @octopi[row + 1].nil? ? nil : @octopi[row + 1][pos]
    ahead = @octopi[row][pos + 1].nil? ? nil : @octopi[row][pos + 1]
    behind = pos.zero? ? nil : @octopi[row][pos - 1]
    upahead = above && ahead ? @octopi[row - 1][pos + 1] : nil
    upbehind = above && behind ? @octopi[row - 1][pos - 1] : nil
    downahead = below && ahead ? @octopi[row + 1][pos + 1] : nil
    downbehind = below && behind ? @octopi[row + 1][pos - 1] : nil

    [above, below, ahead, behind, upahead, upbehind, downahead, downbehind].compact
  end

  private

  def make_octopi!(arr)
    arr.each_with_index do |row, row_idx|
      octo_row = []
      row.each_with_index do |num, col_idx|
        octo = Octopus.new(energy: num, row: row_idx, pos: col_idx, set: self)
        octo_row << octo
      end
      @octopi << octo_row
    end
    @octopi.each { |row| row.each(&:set_adjacents!) }
  end
end


    simple_octopi =[
                    [1,1,1,1,1],
                    [1,9,9,9,1],
                    [1,9,1,9,1],
                    [1,9,9,9,1],
                    [1,1,1,1,1]
                  ]


octo_set = OctopiSet.new(simple_octopi)
octo_set.step!
p octo_set.to_a
