def rotate_array(array)
  cloned_array = array.dup
  cloned_array << cloned_array.shift
end

# puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# puts rotate_array(['a']) == ['a']

# x = [1, 2, 3, 4]
# puts rotate_array(x) == [2, 3, 4, 1]   # => true
# puts x == [1, 2, 3, 4]

# def rotate_string(string)
#   string[1..-1] + string[0]
# end

# def rotate_integer(integer)
#   int_string = rotate_string(integer.to_s)
#   int_string.to_i
# end

=begin
algorithm:
-change num into a string
-slice the last num strings in the new string, change into an array and assign to a variable
-call rotate array on the array
-join the result array, append to first part of string num and convert result into an integer
=end

def rotate_rightmost_digits(number, i)
  all_digits = number.to_s.chars
  all_digits[-i..-1] = rotate_array(all_digits[-i..-1]).join
  all_digits.join.to_i
end

# p rotate_rightmost_digits(735291, 2) == 735219

def max_rotation(number)
  num_of_rotation = number.to_s.size
  num_of_rotation.downto(1) do |i|
    number = rotate_rightmost_digits(number, i)
  end
  number
end
p max_rotation(735291) == 321579
p max_rotation(3) == 3
p max_rotation(35) == 53
p max_rotation(105) == 15 # the leading zero gets dropped
p max_rotation(8_703_529_146) == 7_321_609_845