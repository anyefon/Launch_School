# def multiply_list(arr1, arr2)
#   products = []
#   arr_size = arr1.size

#   arr_size.times do |i|
#     products << arr1[i] * arr2[i]
#   end
#   products
# end

def multiply_list(arr1, arr2)
  arr1.zip(arr2).map{|arr| arr.reduce(1, :*)}
end

puts multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

