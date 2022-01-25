require 'pry-byebug'


def get_height(y_depth)
  y_vel = y_depth.abs - 1

  max_height = 0
  until y_vel.zero?
    max_height += y_vel
    y_vel -= 1
  end
  max_height
end

p get_height(-110)
