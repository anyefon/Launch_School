flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# counter = 0
# loop do
#   break if counter == flintstones.size
#   if flintstones[counter][0..1] == 'Ba'
#     p flintstones.index(flintstones[counter])
#   end
#   counter += 1
# end

# this implementation loops through the array regardless of whether the first element has been found.

p flintstones.index { |name| name[0, 2] == "Be" }
