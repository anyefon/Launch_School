def interleave(arr1, arr2)
  interleaved_arr = []
  arr_length = arr1.size

  arr_length.times do |i|
    interleaved_arr << arr1[i] << arr2[i]
  end
  interleaved_arr
end

# def interleave(arr1, arr2)
#   interleaved_arr = arr1.zip(arr2).flatten
# end

puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']