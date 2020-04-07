def average(arr)
  format("%0.3f", arr.sum.to_f/arr.count)
end

puts average([1, 5, 87, 45, 8, 8]) 
puts average([9, 47, 23, 95, 16, 52]) 
