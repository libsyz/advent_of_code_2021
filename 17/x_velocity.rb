require 'pry-byebug'

def x_velocity(distance)
  counter = 1
  while counter <= distance
    distance = distance - counter
    counter += 1
  end

  distance.zero? ? [counter - 1, distance] : [counter - 1, distance]
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
  coords
end

p get_arc(7, 3)
