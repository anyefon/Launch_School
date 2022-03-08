def is_double?(num)
  str_num = num.to_s
  half = str_num.size / 2
  first_half, second_half = str_num[0..half - 1], str_num[half..-1]
  first_half == second_half
end

def twice(num)
  num_size = num.to_s.size
  is_double?(num) && num_size.even? ? num : num * 2
end

puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10

# better solution
def twice(number)
  string_number = number.to_s
  center = string_number.size / 2
  left_side = center.zero? ? '' : string_number[0..center - 1]
  right_side = string_number[center..-1]

  return number if left_side == right_side
  return number * 2
end