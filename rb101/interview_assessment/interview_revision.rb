=begin
# For "x", determine how many positive integers less than or equal to "x" are odd but not prime. Assume "x" is an integer between 1 and 10000.

# Example: 5 has three odd numbers (1,3,5) and only the number 1 is not prime, so the answer is 1
# Example: 10 has five odd numbers (1,3,5,7,9) and only 1 and 9 are not prime, so the answer is 2

# A prime number (or a prime) is a natural number greater than 1 that has no positive divisors other than 1 and itself.

p odd_not_prime(15) == 3
p odd_not_prime(48) == 10
p odd_not_prime(82) == 20
=end

=begin
input: integer
output: integer, number of integers odd but not prime
-------
mental model of problem if needed:
how many positive integers are odd but not prime
between range 1..x.

--------------
--------------
rules and definitions:
A prime number (or a prime) is a natural number greater than 1 that has no positive divisors other than 1 and itself.
--------------
--------------
methods/statements in mind:
upto
iterative method
appending method
modulus 
--------------
--------------
high level structure:
initialize array
initialize variable to keep track of numbers that meet requirements
take range 1..input and put it into array
iterate over array and count the amount of numbers that are odd but not prime
find odd: num.odd?
find not prime: num % (all  numbers before it except 1) != 0
--------------
--------------
implementation:
def odd_not_prime(max_number)
  array = []
  number_count = 0
  
  1.upto(max_number) do |num|
    array << num
  end
  
  array.each do |num|
    if num.odd? && num % (all numbers between 1 and num) != 0
    number_count += 1
    end
  end
  
  number_count
end
      
-------
=end
# def is_prime?(num)
  
  
#   (2..(num - 1)).each do |n|
#     return false if num % n == 0
#   end
#   true
# end

# def odd_not_prime(max_number)
#   array = []
#   number_count = 0
  
#   1.upto(max_number) do |num|
#     array << num
#   end
  
#   array.each do |num|
#     if num.odd? && !is_prime?(num)
#     number_count += 1
#     end
#   end
  
#   number_count
# end

# p odd_not_prime(15) == 3
# p odd_not_prime(48) == 10
# p odd_not_prime(82) == 20


=begin
i: integer
o: integer
explicit req:
- takes integer 1-10000
- returns number of integers that are:
  positive (implicit?)
  odd
  not prime
  less or equal to x

implicit req: none?
examples: in task description
ds: none/integer
algorithm:
select from integers from 1 to x (included). Criterion:
  odd & not prime(1)
count how many items were selected and return number
 
(1) prime?
is divisible only by one and itself
check if any from 2..(num-1) divides num without rest

=end

# def prime?(num)
#   #not correct
#   (2..(num-1)).any? do |integer|
#     num % integer == 0
#   end
# end

# def odd_not_prime(int)
#   (1..int).select do |number|
#     number.odd? && !prime?
#   end
  
  
# end

=begin
Problem:
-number of positve non-prime integers less than or equal to x.
-Input: a integer b/w 1 and 10000
-output: number of positve non-prime numbers

Examples:
-Example: 5 has three odd numbers (1,3,5) and only the number 1 is not prime, so the answer is 1
-Example: 10 has five odd numbers (1,3,5,7,9) and only 1 and 9 are not prime, so the answer is 2

Data structure 
-Array

Algorithm:
-create an array called not_primes
-iterate over numbers from 1 upto the given number
-For each number in check if it is odd and not prime(helper function)
-if so append to primes array
-return the length of the array


=end

# def prime?(num)
#   return false if num <= 1
#   2.upto(num - 1) do |curr_num|
#     return false if num % curr_num == 0
#   end
#   true
# end

# def prime?(num)
#   (2...num).any?{|j| num % j == 0}
# end

# p !(prime?(7))

# def odd_not_prime(number)
#   not_primes = []

#   1.upto(number) do |i|
#     not_primes << i if (i.odd? && !(prime?(i)))
#   end
#   not_primes.size
# end


#**************************************************************************

=begin

**Problem Requirements**

**Rules / Requirement/ Boundaries (Check test cases)**

**Explicit**
-

**Implicit**
-

**Special Terms**
-

**Questions**
- Input:
- Output/return:

**Data Structures**
- input:
- Output:
- Intermediate:
- Storage:

**Algorithm**
-

**Implementation details**
-

=end



=begin

**Problem Requirements**
**Explicit**

**Questions**

**Implicit**

**Rules / Requirement/ Boundaries (Check test cases)**

**Data Structures**

**Algorithm**

**Implementation details**

=end