=begin
The maximum sum subarray problem consists in finding the maximum sum of a contiguous subsequence 
in an array or list of integers:

maxSequence [-2, 1, -3, 4, -1, 2, 1, -5, 4]
-- should be 6: [4, -1, 2, 1]
Easy case is when the list is made up of only positive numbers and the maximum sum is the sum of 
the whole array. If the list is made up of only negative numbers, return 0 instead.

Empty list is considered to have zero greatest sum. Note that the empty list or array is also a 
valid sublist/subarray.
Checkout Kadane's algorithm

input:
-an array
output:
-maximum sum of contiguous subsequence in array
rules:
-return 0 if list is made up of only negative numbers.
-empty list has a zero greatest sum
algorithm:
-create variables max_sum, current_sum and assign 0 to them
-if all elements in array are negative, return zero
-for each element in array,
  -current_sum is the maximum between the current element and the current elt + current_sum
  -if current_sum is greater than max_sum, assign current_sum to max_sum
-return max_sum
=end

def max_sequence(arr)
  #your code here
  max_sum = 0
  current_sum = 0
  return 0 if arr.all?{|num| num < 0}

  arr.each do |elt|
    current_sum = [elt, elt + current_sum].max

    if current_sum > max_sum
      max_sum = current_sum
    end
  end
  max_sum
end