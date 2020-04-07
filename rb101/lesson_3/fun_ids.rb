require  "pry"

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
  binding.pry
end

one = "one"
two = "two"
three = "three"

puts mess_with_vars(one, two, three)

puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"