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

  def unflash!
    @flashing = false
  end

  def step!
    @energy += 1 unless @flashing
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
  attr_reader :flashing_queue, :flash_count

  def initialize(arr)
    @octopi = []
    @flashing_queue = []
    @flash_count = 0
    make_octopi!(arr)
  end

  def synchronyzed?
    @octopi.flatten.all? { |octopus| octopus.energy.zero? }
  end


  def step!
    @octopi.each { |row| row.each(&:step!) }

    until @flashing_queue.empty?
      @flashing_queue[0].emit_flash
      @flash_count += 1
      @flashing_queue.delete_at(0)
    end

    @octopi.flatten.select(&:flashing?).each(&:unflash!)
  end

  def to_a
    @octopi.map { |row| row.map { |oct| oct.energy }  }
  end

  def get_adjacents(row, pos)

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
                    [4,5,2,5,4,3,6,4,1,7],
                    [1,8,5,1,2,4,2,5,5,3],
                    [5,4,2,1,4,3,5,5,2,1],
                    [8,4,3,1,3,2,5,4,4,7],
                    [4,5,1,7,4,3,8,3,3,2],
                    [3,5,2,1,2,6,2,1,1,1],
                    [3,3,3,1,5,4,1,7,3,4],
                    [4,3,5,1,8,3,6,6,4,1],
                    [2,7,5,3,8,8,1,4,4,2],
                    [7,7,1,7,6,1,6,8,6,3]
                  ]


counter = 0
octo_set = OctopiSet.new(simple_octopi)

until octo_set.synchronyzed?
  octo_set.step!
  counter += 1
end

p counter
