def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# a_string_param is reassigned in the tricky_method hence the it no longer references the my_string
# object.  The an_array_param argument is modified in the tricky_method (mutated as-is) which still
# references the same object as my_array .