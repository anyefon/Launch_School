=begin
In this little assignment you are given a string of space separated numbers,
 and have to return the highest and lowest number.

Example:

high_and_low("1 2 3 4 5")  # return "5 1"
high_and_low("1 2 -3 4 5") # return "5 -3"
high_and_low("1 9 3 4 -5") # return "9 -5"
Notes:

All numbers are valid Int32, no need to validate them.
There will always be at least one number in the input string.
Output string must be two numbers separated by a single space, and highest number is first.

input:
-string of space separated numbers
output:
-a string of the highest and lowest number separated by a string

algorithm
-break string up into individual string numbers and push into an array
-sort array 
-extract first and last elements of array ,join them and return resulting string 
=end

def high_and_low(numbers)
  num_arr = numbers.split(' ').map {|item| item.to_i}.sort
  [num_arr.last, num_arr.first].join(' ')
end

puts high_and_low("1 2 3 4 5")  # return "5 1"
puts high_and_low("1 2 -3 4 5") # return "5 -3"
puts high_and_low("1 9 3 4 -5") # return "9 -5"