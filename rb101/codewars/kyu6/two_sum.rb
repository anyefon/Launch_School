=begin
Write a function that takes an array of numbers (integers for the tests) and a target number.
 It should find two different items in the array that, when added together, give the target value. 
 The indices of these items should then be returned in a tuple like so: (index1, index2).

For the purposes of this kata, some tests may have multiple answers; any valid solutions will be 
accepted.

The input will always be valid (numbers will be an array of length 2 or greater, and all of the 
items will be numbers; target will always be the sum of two different items from that array).

Based on: http://oj.leetcode.com/problems/two-sum/

twoSum [1, 2, 3] 4 === (0, 2)

input:
- an array of integers and a target value
output:
-an array of indices of values which add up to the target value

algorithm:
-create an array of indices
-calculate the length of the array given
-create a variable called index assigned to 0
-create a loop
  - break if index == input array length
  -for each index value i ranging from 0 to the length of input array - 1
    - if index == i, skip to next iteration 
    - if input[index] + input[i] == target value
      - append [index, i] to indices array
  -increment the value of index
-return any value pair from indices
=end
def two_sum(numbers, target)
  # solution
  pairs = []
  current_index = 0

  loop do
    break if current_index == numbers.length

    (0..numbers.length - 1).each do |i|
      next if current_index == i # don't add number to itself
      pairs << [current_index, i] if numbers[current_index] + numbers[i] == target
    end
    current_index += 1
  end
  pairs.first # returning the first pair in array
end
