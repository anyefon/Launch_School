arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

sorted_arr = arr.sort_by do |arr|
  arr.select do |num|
    num % 2 == 1
  end
end

p sorted_arr == [[1, 8, 3], [1, 6, 7], [1, 4, 9]]