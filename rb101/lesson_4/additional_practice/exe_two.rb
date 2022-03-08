ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
# ages_arr = ages.values
# p ages_arr

# puts ages_arr.inject(0, :+)

sum = 0



loop do 
  break if ages.size == 0
  sum += ages.shift.last
end

p ages
p sum
# The second implementation may not be the best because the ages hsh is modified by the end of the operation
