=begin
# For "x", determine how many positive integers less than or equal to "x" are odd but not prime. Assume "x" is an integer between 1 and 10000.

# Example: 5 has three odd numbers (1,3,5) and only the number 1 is not prime, so the answer is 1
# Example: 10 has five odd numbers (1,3,5,7,9) and only 1 and 9 are not prime, so the answer is 2

# A prime number (or a prime) is a natural number greater than 1 that has no positive divisors other than 1 and itself.

p odd_not_prime(15) == 3
p odd_not_prime(48) == 10
p odd_not_prime(82) == 20

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
#   return false if num == 1
#   !((2...num).any?{|j| num % j == 0})
# end

# def odd_not_prime(number)
#   not_primes = []

#   1.upto(number) do |i|
#     not_primes << i if (i.odd? && !(prime?(i)))
#   end
#   not_primes.size
# end


# p odd_not_prime(15) == 3
# p odd_not_prime(48) == 10
# p odd_not_prime(82) == 20

# def prime?(num)
#   return false if num <= 1
#   2.upto(num - 1) do |curr_num|
#     return false if num % curr_num == 0
#   end
#   true
# end

=begin
The input is a string str of digits. Cut the string into chunks (a chunk here is a substring of the initial string) of size sz 
(ignore the last chunk if its size is less than sz).

If a chunk represents an integer such as the sum of the cubes of its digits is divisible by 2, reverse that chunk; otherwise rotate it to 
the left by one position. Put together these modified chunks and return the result as a string.

If

sz is <= 0 or if str is empty return ""
sz is greater (>) than the length of str it is impossible to take a chunk of size sz hence return "".
Examples:

input:
- a string and an integer
-output:
-a string
rules:
-divide string into substrings of size sz
-ignore last substring if size is less than sz
-if sum of cubes of digits is divisible by 2, reverse chunk, else rotate to the left by one position
-put modified chunks together
- return "" if sz <= 0, input string is empty, and sz is greater than length of input string

algorithm:
-first break input string into substrings of size sz and populate an array substrings
-if substring size is less than sz, ignore it
  -create array substrings
  -create a string substring
  -for each character in given string, append to substring if size is less than sz
  -else append substring to substrings array
-check if sum of cubes of digits is divisible by 2, if so reverse chunk
  -create a sum variable
  -for each substring in substrings array
    -for each char in substring
    -convert to integer, raise it to the power 3 and add to sum
   -if sum is divisible by 2, reverse substring and append to an array 
-else rotate it one position to the left
=end

def create_substrings(str, sz)
  substrings = []
  substring = ""

  str.each_char do |char|
    if substring.size < sz
      substring << char
    else
      substrings << substring
      substring = char
    end
  end
  substrings << substring if substring.size == sz
  substrings
end

def sum_of_cubes(str)
  sum = 0
  str.each_char do |char|
    sum += (char.to_i) ** 3
  end
  sum
end

def revrot(str, sz)
  return "" if sz <= 0 || str.size == 0 || sz > str.size
  arr = []
  substrings = create_substrings(str, sz)
  substrings.each do |substring|
    if sum_of_cubes(substring) % 2 == 0
      arr << substring.chars.reverse.join
    else
      arr << substring[1..-1] + substring[0]
    end
  end
  arr.join
end


p revrot("123456987654", 6) == "234561876549"
p revrot("123456987653", 6) == "234561356789"
p revrot("66443875", 4) == "44668753"
p revrot("66443875", 8) == "64438756"
p revrot("664438769", 8) == "67834466"
p revrot("123456779", 8) == "23456771"
p revrot("", 8) == ""
p revrot("123456779", 0) == "" 
p revrot("563000655734469485", 4) == "0365065073456944"
