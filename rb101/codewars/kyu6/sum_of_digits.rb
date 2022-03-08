=begin
Digital root is the recursive sum of all the digits in a number.

Given n, take the sum of the digits of n. If that value has more than one digit, 
continue reducing in this way until a single-digit number is produced. 
The input will be a non-negative integer.

Examples
    16  -->  1 + 6 = 7
   942  -->  9 + 4 + 2 = 15  -->  1 + 5 = 6
132189  -->  1 + 3 + 2 + 1 + 8 + 9 = 24  -->  2 + 4 = 6
493193  -->  4 + 9 + 3 + 1 + 9 + 3 = 29  -->  2 + 9 = 11  -->  1 + 1 = 2

input:
-an integer n
output:
-single-digit number which is the recursive sum of all the digits in n

Tests:
-see above

algorithm:
-create a running total variable and assign it a value of n
-Enter a loop
  -given sum, break number into array of individual digits and assign to a variable digits
  -break out of loop if array length is equal to 1
  -sum up all values in array and assign it to running total variable
-return single-digit number 
=end

def digital_root(n)
  # ...
  running_total = n

  loop do 
    digits_arr = running_total.digits
    break if digits_arr.size == 1
    running_total = digits_arr.sum
  end
  running_total
end

=begin
-Interesting solution using recursion
def digital_root(n)
  (0..9).include?(n) ? n : digital_root(n.digits.reduce(:+))
end

-More readable solution
def digital_root(n)
  num = n
  num = num.digits.reverse.sum while num > 9
  num
end

=end