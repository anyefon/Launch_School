=begin
If we list all the natural numbers below 10 that are multiples of 3 or 5, 
we get 3, 5, 6 and 9. The sum of these multiples is 23.

Finish the solution so that it returns the sum of all the multiples of 3 or 5 
below the number passed in. Additionally, if the number is negative, return 0 
(for languages that do have them).

Note: If the number is a multiple of both 3 and 5, only count it once.

input:
-integer could be positive or negative
output:
-sum of all multiples of 3 or 5 or 0if the number passed in was negative

algorithm
-if integer passed in is negative, return 0
-create an array of multiples
-for numbers in the range of 1 upto integer-1, append multiples of 3 and 5 to multiples array
-test for uniqueness of the array elts
-sum up the elements
=end

# def solution(number)
#   # put your solution here
#   return 0 if number < 0
#   multiples = []
#   0.upto(number - 1) do |i|
#     multiples << i if i % 3 == 0
#     multiples << i if i % 5 == 0
#   end

#   multiples.uniq.reduce(:+)
#  end

# better solution

def solution(number)
  (1...number).select {|i| i%3==0 || i%5==0}.inject(:+)
end

 puts solution(10)
 puts solution(200)