require 'pry-byebug'

def get_x_velocity(distance)
  counter = 1
  while counter <= distance
    distance = distance - counter
    counter += 1
  end
  remaining_distance = distance
  remaining_distance.zero? ? [counter - 1, remaining_distance] : [counter - 1, remaining_distance]
end


# will give you all x and y coordinates until the x vel goes to 0
def get_arc(x_velocity, y_velocity)
  coords = []
  x_pos = 0
  y_pos = 0
  x_velocity.downto(0).each do |x_vel|
    if y_velocity >= 0
      y_pos = y_velocity
    else
      y_pos = y_pos + y_velocity
    end

    x_pos = x_pos + x_vel
    coords << [x_pos, y_pos]
    y_velocity -= 1
    # binding.pry
  end
  [coords, y_velocity]
end

def get_fall(starting_y, y_bounds)
  y_pos = starting_y
  y_velocity = 0
  fall = []

  until fall.last && fall.last < y_bounds.min
    y_pos = y_pos + y_velocity
    fall << y_pos
    y_velocity -= 1
  end
  fall
end

# p get_x_velocity(30)
coords, y = get_arc(7, 45)
p y
p get_fall(coords.last[1], (-10..-5))
