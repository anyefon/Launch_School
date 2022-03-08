=begin
Create a function named divisors/Divisors that takes an integer n > 1 and 
returns an array with all of the integer's divisors(except for 1 and the number itself), 
from smallest to largest. If the number is prime return the 
string '(integer) is prime' (null in C#) (use Either String a in Haskell and Result<Vec<u32>, String> in Rust).

Example:
divisors(12) # should return [2,3,4,6]
divisors(25) # should return [5]
divisors(13) # should return "13 is prime"

input:
-integer greater than 1
output
-array of divisors without 1 and the number itself
-print "number is prime" for prime numbers
algorithm:
-create an array of divisors
-for ever number in range 1 to n
  -check if n divided by current number has reminded
    -if so append current number to divisors array
-eliminate 1 and number from the divisors array
-if divisors array is empty
  -return "n is a prime number"
-else
  -return sub array
=end

def divisors(n)
  divisors = []

  (1..n).each do |number|
    if n % number == 0
      divisors << number
    end
  end
  
  if divisors[1..divisors.length - 2].empty?
    return "#{n} is prime"
  else
    return divisors[1..divisors.length - 2]
  end
end

p divisors(12) # should return [2,3,4,6]
p divisors(25) # should return [5]
p divisors(13) # should return "13 is prime"