# In this Kata, you will be given two integers n and k and your task is to remove 
# k-digits from n and return the lowest number possible, without changing the order of the 
# digits in n. Return the result as a string.

# Let's take an example of solve(123056,4). We need to remove 4 digits from 123056 and 
# return the lowest possible number. The best digits to remove are (1,2,3,6) so that the remaining 
# digits are '05'. Therefore, solve(123056,4) = '05'.

# Note also that the order of the numbers in n does not change: solve(1284569,2) = '12456',
#  because we have removed 8 and 9.

# input 
#  two integers n and k
# output
#  a string of the lowest possible number after removing k-digits

# Rules
#  order of digits in n should remain unchanged

# num = 123056

# str_arr = num.to_s.chars
# p str_arr
# num_arr = str_arr.map{|i| i.to_i}
# p num_arr
# combinations = num_arr.combination(2).to_a
# p combinations
require "pry"
def get_pairs(n, k, arr_size)
  n.to_s.chars.map(&:to_i).combination(arr_size-k).to_a
end

def solve(n, k)
  arr_size = n.to_s.size
  pairs = get_pairs(n, k, arr_size)
  pairs.sort_by!{ |arr| arr.join('') }
  pairs.shift.join('')
end

p solve(1284569,2)