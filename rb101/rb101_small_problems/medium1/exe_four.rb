# Populate the lights array with 'false' representing the off-state
def get_lights(n)
  lights = []

  n.times {|_| lights << false }
  lights
end

# get multiples of the round number less than # of lights n
def get_lights_to_toggle(round, n)
  lights_to_toggle = []
  i = 1
  # get multiples of the round number less than n
  loop do
    break if round * i > n
    lights_to_toggle << round * i
    i += 1
  end
  lights_to_toggle
end

# toggle state of lights
def toggle_lights(lights_to_toggle, lights)
  lights_to_toggle.each do |light|
    lights[light - 1] = !lights[light - 1]
  end
end

# get lights with a state of 'true'
def get_lit_lights(lights)
  lit_lights = []

  lights.each_with_index do |light, index|
    lit_lights << index + 1 if light
  end
  lit_lights
end

# main function
def lighting(num)
  lights = get_lights(num) # array of booleans

  1.upto(num) do |round|
    lights_to_toggle = get_lights_to_toggle(round, num)
    toggle_lights(lights_to_toggle, lights)
  end
  get_lit_lights(lights)
end

puts lighting(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]
