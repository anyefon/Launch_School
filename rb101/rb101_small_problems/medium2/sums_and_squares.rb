# input
#  integer
# output
#  sum square - square sum

# Algorithm
# create variables sum_square, square_sum, squares_array
# for sum_square, create range (1..int), convert to array, calculate sum and square
#  create a loop that counts from 1 upto integer given
#   for each iteration, square current number and push to squares_array
#  after loop, sum squares in squares_array and assign to square_sum
#  return difference between sum square and square sum

def sum_square_difference(int)
  sum_square = nil
  square_sum = nil
  squares_array = []

  sum = (1..int).to_a.inject(:+)
  sum_square = sum**2

  1.upto(int) do |i|
    squares_array << i**2
  end

  square_sum = squares_array.inject(:+)
  sum_square - square_sum
end

puts sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
puts sum_square_difference(10) == 2640
puts sum_square_difference(1) == 0
puts sum_square_difference(100) == 25164150

# def sum_square_difference(n)
#   sum = 0
#   sum_of_squares = 0

#   1.upto(n) do |value|
#     sum += value
#     sum_of_squares += value**2
#   end

#   sum**2 - sum_of_squares
# end