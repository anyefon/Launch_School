require "pry"
array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
binding.pry
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# Both arrays, array1 and array2 reference different blocks of memory. This can be proven by typing
# `array1.object_id == array2.object_id` into pry. However their elements (of both arrays) reference 
# the same string objects in memory.


