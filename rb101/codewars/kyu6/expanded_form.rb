=begin
Write Number in Expanded Form
You will be given a number and you will need to return it as a string in Expanded Form. For example:

expanded_form(12); # Should return '10 + 2'
expanded_form(42); # Should return '40 + 2'
expanded_form(70304); # Should return '70000 + 300 + 4'
NOTE: All numbers will be whole numbers greater than 0.

input:
-a number
output:
-a string of number in expanded form
rules:
-ignore zeros in expanded form
algorithm:
-split number into individual digits and place in an array
-create an empty array variable
-for each value in array,
  -if value is not zero
    -convert value to string and concatenate (array.length-1-index)number of zeros behind value
    -push resulting string to num array
-join values with ' + ' and return 
=end
require 'pry'
def expanded_form(num)
  # Your code here
  str_arr = []
  num.digits.reverse.each_with_index do |digit, index|
    next if digit == 0
    zeros = num.digits.length - 1 - index
    str_arr << "#{digit}#{'0' * zeros}"
  end
  str_arr.join(" + ")
end

p expanded_form(70304)