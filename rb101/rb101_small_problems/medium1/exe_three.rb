# def rotate_array(array)
#   array[1..-1] + [array[0]]
# end

# def rotate_rightmost_digits(number, n)
#   numbers = number.digits.reverse
#   numbers[-n..-1] = rotate_array(numbers[-n..-1])
#   numbers.join.to_i
# end

# def max_rotation(num)
#   num_size = num.digits.size
  
#   loop do
#     break if num_size - 1 == 0 # rotating the last digit is of no use since the number doesn't change
#     num = rotate_rightmost_digits(num, num_size)
#     num_size -= 1
#   end

#   num
# end
def max_rotation(number)
  num_size = number.to_s.size
  str_num = number.to_s
  0.upto(num_size - 1) do |i|
    str_num = str_num[0, i] + str_num[(i + 1)..-1] + str_num[i]
  end
  str_num.to_i
end

puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845
puts max_rotation(16000)