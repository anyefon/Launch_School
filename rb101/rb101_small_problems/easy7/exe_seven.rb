def show_multiplicative_average(arr)
  product = arr.reduce(1, :*)
  arr_size = arr.size
  result = "The result is "

  format("#{result} %.3f", product / (arr_size * 1.0))
end

puts show_multiplicative_average([3, 5])
puts show_multiplicative_average([6])
puts show_multiplicative_average([2, 5, 7, 11, 13, 17])