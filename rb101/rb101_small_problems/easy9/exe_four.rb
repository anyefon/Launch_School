def sequence(num)
  number_arr = []
  num > 0 ? 1.upto(num){|i| number_arr << i } : num.upto(-1){|i| number_arr << i }
  number_arr
end

puts sequence(5) == [1, 2, 3, 4, 5]
puts sequence(3) == [1, 2, 3]
puts sequence(-1) == [-1]