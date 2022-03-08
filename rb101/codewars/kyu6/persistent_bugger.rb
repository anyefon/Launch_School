=begin
Write a function, persistence, that takes in a positive parameter num and returns 
its multiplicative persistence, which is the number of times you must multiply the digits in 
num until you reach a single digit.

For example:

 persistence(39) # returns 3, because 3*9=27, 2*7=14, 1*4=4
                 # and 4 has only one digit
                  
 persistence(999) # returns 4, because 9*9*9=729, 7*2*9=126,
                  # 1*2*6=12, and finally 1*2=2

 persistence(4) # returns 0, because 4 is already a one-digit number

input:
-a positive number
output:
-a number which represents its multiplicative persistance
algorithm:
-create a variable called persistance and assign it the value of zero
-create a loop
   -split up number into digits 
  -check if number contains one digit, if so break out of loop
  -multiply digits and assign new result to number
  -increment the persistance value
-return the persistance value
=end

def persistence(n)
  # your code
  persistance = 0

  loop do
    break if n.digits.length == 1
    n = n.digits.reduce(1, :*)
    persistance += 1
  end
  persistance
end