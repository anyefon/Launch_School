=begin
Given an integer n, find the maximal number you can obtain by deleting 
exactly one digit of the given number.

Example
For n = 152, the output should be 52;

For n = 1001, the output should be 101.

Input/Output
[input] integer n

Constraints: 10 ≤ n ≤ 1000000.

[output] an integer
=end

def delete_digit(n)
  #coding and coding..
  numbers = []
  num_str = n.to_s

  0.upto(num_str.length - 1) do |i|
    numbers << (num_str[0, i] + num_str[i+1, (num_str.length - 1)]).to_i
  end
  p numbers
  numbers.max
end

puts delete_digit(152)
puts delete_digit(1001)