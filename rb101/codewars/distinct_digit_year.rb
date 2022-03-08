# Task
# The year of 2013 is the first year after the old 1987 with only distinct digits.

# Now your task is to solve the following problem: given a year number, find the minimum year number which is strictly larger than the given one and has only distinct digits.

# Input/Output
# [input] integer year
# 1000 ≤ year ≤ 9000

# [output] an integer
# the minimum year number that is strictly larger than the input number year and all its digits are distinct.

=begin
input:
 -integer year
 -year integer between 1000 and 9000
assumptions:
 -the input will always be a number, no invalid inputs
output:
 -minimum integer year number strictly larger than the input number year and all its digits distinct.
  i.e no repeating digits
test cases:
-distinct_digit_year(1987) = 2013
-distinct_digit_year(1000) = 1234
-distinct_digit_year(9000) = invalid input
algorithm:
-assuming input int is always valid, increment input by one
-convert input to string, separate into characters and push the chars into an array
-if array has unique elements
  -return the current year integer
=end

def distinct_digit_year(year)
  #coding and coding..
  loop do
    year = year + 1

    char_arr = year.to_s.chars

    if char_arr == char_arr.uniq
      break year
    end
  end
end

puts distinct_digit_year(1987)
puts distinct_digit_year(2013)
puts distinct_digit_year(2229)


