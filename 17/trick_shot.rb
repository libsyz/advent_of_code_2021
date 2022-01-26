
require 'pry-byebug'

def simulate(x_range, y_range)
  hits = 0

  (1..202).each do |initial_x_speed|
    (-115..210).each do |initial_y_speed|
      y_pos = 0
      x_pos = 0
      # p [initial_x_speed, initial_y_speed]
      x_speed = initial_x_speed
      y_speed = initial_y_speed
      until y_pos < y_range.min

        x_pos += x_speed
        y_pos += y_speed

        if x_range === x_pos && y_range === y_pos
          hits += 1
          break
        end
        x_speed -= 1 unless x_speed.zero?
        y_speed -= 1
      end
    end
  end

  hits
end

  # x=156..202, y=-110..-69

p  simulate(156..202, -110..-69)
