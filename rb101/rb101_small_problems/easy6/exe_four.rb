def reverse_array(arr)
  arr_size = arr.size
  puts arr_size

  arr_size / 2.times do |i|
    arr[i], arr[-(i + 1)] = arr[-(i + 1)], arr[i]
  end

  arr
end

list = %w(a b e d c)
p result = reverse_array(list)
puts list.object_id == result.object_id