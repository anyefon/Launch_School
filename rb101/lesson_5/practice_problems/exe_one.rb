arr = ['10', '11', '9', '7', '8']

# sorted_arr = arr.sort_by do |char|
#   0 - char.to_i
# end

sorted_arr = arr.sort do |a, b|
  b.to_i <=> a.to_i
end

p sorted_arr