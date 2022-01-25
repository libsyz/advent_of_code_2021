require_relative './x_velocity.rb'
require 'pry-byebug'


def trick_shot(x_range:, y_range:)
  target_missed = false
  target_reached = false

  x_velocity, _ = x_velocity(x_range.max)
  max_y_reached = 0
  # in the example, now I have 7
  throw_arc, y_velocity = get_arc(x_velocity, max_y_reached)

  # did the arc end below the box
  until target_missed
    if within_bounds?(throw_arc, x_range, y_range)
      max_y_reached = max_y_reached
    end

    if above_bounds?(throw_arc, x_range, y_range)
      fall = get_fall(throw_arc, y_velocity)
      target_missed = true if fall.none? { |point| y_range.include?(point) }
    end

    max_y_reached += 1
    throw_arc, y_velocity = get_arc(x_velocity, y_velocity)
  end
    # did any of the coords hit the box

  # did the arc end above the box
    # project the fall
    # update the y if it hits



end


trick_shot(x_range: (20..30), y_range: (-10..-5))
