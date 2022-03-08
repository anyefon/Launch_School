=begin
Given an Array of Integers, return all pairs of integers that have a difference of 2.
The result array should be sorted in ascending order of values.
Assume there are no duplicate integers in the array.
The order of the integers in the input array should not matter.

Test Cases:
p difference_of_two([1, 2, 3, 4]) ==  [[1, 3], [2, 4]]
p difference_of_two([4, 1, 2, 3]) == [[1, 3], [2, 4]]
p difference_of_two([4, 3, 1, 5, 6]) == [[1, 3], [3, 5], [4, 6]]

p difference_of_two([1, 23, 3, 4, 7]) == [[1, 3]]
p difference_of_two([2, 4]) == [[2, 4]]
p difference_of_two([1, 4, 7, 10, 13]) == []

Problem:
- get pairs that are only difference of 2: a - b = |2| #abs
- Input array has no duplicates
- Order doesn't matter for Input Array

Order
- Sort each sub-array in ascending order. [2,4] Good. [4,2] Bad. 
- Sort the sub-arrays and the integer in the sub-arrays in ascending order

Implicit Rules shown by example test cases:
- Input array order doesn't matter
- 3 is listed twice (example 3) 
- INput array contains only positive Integers

- If there only one matching pair, the output should be that pair in an inner-array
- If there are no matching pairs, return empty Array
- Return is always 2D array, unless there's no pairs
- Return a new Array

Data Structure:
- Input? Array of Integers
- Output? Return a new Array either 2D array or an empty Array

Array --> Hash --> Array
String --> Array --> String

Anye:
1. initialize result = []
2. Loop through the Input Array
    - variable counter = 0, to track the index
    - variable operand_1 = array[counter]
    - operand_1 - operand_2 , if the absolute value is 2, append [operand_1, operand_2] to result
    - increment counter
3. return result array

Rodney: 
ALG:
- sort the incoming array by order (sort!) [1,2..]
- initialize an empty results array 
- initialize an empty pairs array
- //find all pairs of the array
  - use the upto method twice to iterate through the array
  - iterate twice through the array (inner and outer loop)
    - inner loop should begin at 1
  - push all pairs into pairs array (if clause - if .size == 2)
- //select pairs that have a difference of two
  - use the select method to check if elements in each subarray have a difference of two. (x[1]-x[0]).abs == 2
  - push all selected into results array.
- //return the selected pairs
  - return an empty array if empty
  
Carson: 
ALG:
1. define a method that takes an array as an argument
2. initialize a variable set to an empty array, results
3. Iterate into the given array
4. push the current number and number + 2 if number +  2 is in the given array
  a. given number and number + 2 should be in their own array, [num, num+ 2]
6. sort the results array by sub-array index 0
7. return the results nested array

Calvin:
ALG
1. set result = []
2. For each integer starting at index 0, 
    find the difference between that integer and all other integers in the   array that have a higher index
    if |difference| == 2
      add both integers to subarray
      sort the subarray
      push the subarray to result
3. sort the result by index 0 of each sub-array

Josh: 
- create list that collects subarray results []
  - sort the list in ascending order, sorted_numbers
  - iterate through sorted_numbers, 
    - find number 2 greater than current_num
      - if there exists in array a number 2 greater than current_number
        - put current_number and number that's 2 more than current_number in subarray
        - put subarray in results list
  - return results list.
  
Mandy:
1. Producing 'pairs' from the input Array
2. Select/eliminating pairs based on the criteria: difference of two
3. sort the integers in the sub-array
4. sort the sub-arrays themselves
=end

# Code

# def difference_of_two(array)
#   results = []
#   array.each do |num|
#     results << [num, num + 2] if array.include?(num + 2)
#   end
#   results.sort
# end


# Solution 1
def difference_of_two(arr)
  pairs = get_pairs(arr)

  pairs.select! { |pair| pair[1] - pair[0] == 2 }

  pairs.sort
end

def get_pairs(arr)
  pairs = []

  arr.each do |num1|
    arr.each do |num2|
      pairs << [num1, num2]
    end
  end

  p pairs
end

[1, 2, 3].combination(2).to_a
=> [[1, 2], [1, 3], [2, 3]]
[1,2] 


[1, 2, 3].permutation(2).to_a
=> [[1, 2], [1, 3], [2, 1], [2, 3], [3, 1], [3, 2]]

[1, 2, 3].product([1,2,3])
=> [[1, 1], [1, 2], [1, 3], [2, 1], [2, 2], [2, 3], [3, 1], [3, 2], [3, 3]]


#p difference_of_two([1, 2, 3, 4]) ==  [[1, 3], [2, 4]]
#p difference_of_two([4, 1, 2, 3]) == [[1, 3], [2, 4]]
difference_of_two([4, 3, 1, 5, 6]) #== [[1, 3], [3, 5], [4, 6]]

#p difference_of_two([1, 23, 3, 4, 7]) == [[1, 3]]
#p difference_of_two([2, 4]) == [[2, 4]]
#p difference_of_two([1, 4, 7, 10, 13]) == []


# Solution 2
def difference_of_two(arr)
  pairs = []

  arr.each_with_index do |num, outer_idx|
    (outer_idx..(arr.length - 1)).each do |inner_idx|
      if (num - arr[inner_idx]).abs == 2
        pairs << [num, arr[inner_idx]].sort
      end
    end
  end

  pairs.sort
end

# Solution 3
def difference_of_two(arr)
  arr.sort.combination(2).select { |sub_arr| sub_arr[1] - sub_arr[0] == 2 }
end