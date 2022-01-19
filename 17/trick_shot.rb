require_relative './x_velocity.rb'
require 'pry-byebug'

def terminating_conditions(positions, x_range, y_range)
  # this might be a very stupid approach
  # knowing that your y is 0, what is the max x you can reach before your beacons y becomes negative?
  if positions.length > 2
    last_two = positions.last(2)
    if positions.all?
    end
  end
end

def run_simulation(x, y)
  positions = []
  until terminating_conditions(positions)
    positions << [x, y]
    x -= 1 unless x.zero?
    y -= 1
  end
end

def trick_shot(x_range:, y_range:)
  target_missed = false
  target_reached = false
  # First goal
     # find what is the max x I need to reach
  # speed



  max_y_reached = 0
  x_velocity = x_velocity(x_range.max)
  y_velocity = 0
  coords = get_coords(x_velocity, y_velocity)
  until target_missed
    positions = get_positions(x)
  # increase the x, y
  # this probably can be solved with a smart formula
  # but I don't know math
  # so I need some sort of brute force approach

  # I guess the first thing I want to do is start approximating boundaries
  end

end


trick_shot(x_range: (20..30), y_range: (-10..-5))
