# input 
#  number
# output 
#  featured number greater than given number

# Algorithm
#  create a featured number variable
#  while num is less than valid number
#   increment number
#   if number is odd && multiple of seven && has no duplicates
#     assign number to featured number and return featured number
#   puts invalid string

# Algorithm for duplicate_digit? method
#  Convert number to str and then split into an array. Use uniq to check for duplicates

def duplicate_digits?(num)
  str_arr =  num.to_s.chars
  str_arr.size == str_arr.uniq.size
end


def featured(num)
  featured_number = nil

  while num <  9_876_543_210
    num += 1
    if num.odd? && num % 7 == 0 && duplicate_digits?(num)
      return featured_number = num
    end
  end
  puts 'There is no possible number that fulfills those requirements.'
end

# Launch School solution

# def featured(number)
#   number += 1
#   number += 1 until number.odd? && number % 7 == 0

#   loop do
#     number_chars = number.to_s.split('')
#     return number if number_chars.uniq == number_chars
#     number += 14
#     break if number >= 9_876_543_210
#   end

#   'There is no possible number that fulfills those requirements.'
# end


puts featured(12) == 21
puts featured(20) == 21
puts featured(21) == 35
puts featured(997) == 1029
puts featured(1029) == 1043
puts featured(999_999) == 1_023_547
puts featured(999_999_987) == 1_023_456_987
puts featured(9_999_999_999)