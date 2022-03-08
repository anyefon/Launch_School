=begin
You might know some pretty large perfect squares. But what about the NEXT one?

Complete the findNextSquare method that finds the next integral perfect square 
after the one passed as a parameter. Recall that an integral perfect square is an integer n 
such that sqrt(n) is also an integer.

If the parameter is itself not a perfect square then -1 should be returned. 
You may assume the parameter is non-negative.

Examples:

findNextSquare(121) --> returns 144
findNextSquare(625) --> returns 676
findNextSquare(114) --> returns -1 since 114 is not a perfect

input:
-a non-negative number n
output:
-square root of n or -1 if not a perfect square
algorithm
-calculate the square root of n
-check if square root of n and square root of n converted to an integer equal
  -increment square root of n by 1
  -return the square root of n increment by 1 squared
-else
  -return -1

=end

def find_next_square(sq)
  # Return the next square if sq is a perfect square, -1 otherwise
  sq_root = Math.sqrt(sq)

  if sq_root == sq_root.to_i
    next_sq_root = sq_root + 1
    return next_sq_root * next_sq_root
  else
    return -1
  end
end

puts find_next_square(121)
puts find_next_square(625)
puts find_next_square(114)