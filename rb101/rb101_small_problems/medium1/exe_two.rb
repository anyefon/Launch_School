def rotate_array(array)
  array[1..-1] + [array[0]]
end

def rotate_rightmost_digits(number, n)
  numbers = number.digits.reverse
  numbers[-n..-1] = rotate_array(numbers[-n..-1])
  numbers.join.to_i
end

puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917

def rotate_rightmost_digits(number, n)
  numbers = number.digits.reverse
  numbers << numbers.delete_at(-n)
  numbers.join.to_i
end