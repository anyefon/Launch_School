=begin
Task
Given a number , Return _The Maximum number _ could be formed from the digits of the number given .

Notes
Only Natural numbers passed to the function , numbers Contain digits [0:9] inclusive

Digit Duplications could occur , So also consider it when forming the Largest

input:
-only Natural numbers
-number can contain duplicate digits
output
-largest possible number from input digits
algorithm
-convert input to string and change into an array of characters
-sort the array and reverse it
-join the array and convert to integer
=end

# def max_number(n)
#   #your code here
#   char_arr = n.to_s.chars
#   reserved_char_arr = char_arr.sort.reverse
#   reserved_char_arr.join("").to_i
# end

def max_number(n)
  n.digits.sort.reverse.join.to_i
end

puts max_number(213)