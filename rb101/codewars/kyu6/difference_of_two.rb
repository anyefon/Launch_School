=begin
The objective is to return all pairs of integers from a given array of integers that have a 
difference of 2.

The result array should be sorted in ascending order of values.

Assume there are no duplicate integers in the array. The order of the integers in the input array 
should not matter.

Examples
[1, 2, 3, 4]  should return [[1, 3], [2, 4]]

[4, 1, 2, 3]  should also return [[1, 3], [2, 4]]

[1, 23, 3, 4, 7] should return [[1, 3]]

[4, 3, 1, 5, 6] should return [[1, 3], [3, 5], [4, 6]]

input:
- an array of integers and a target value
output:
-an array of arrays where the difference b/w each pair results in 2

algorithm:
-create an array of pairs
-calculate the length of the array given
-create a variable called index assigned to 0
-create a loop
  - break if index == input array length
  -for each value in array
    - if array[index] == i, skip to next iteration 
    - if absolute value of array[index] - i == 2
      - append [array[index], i] to pairs array if it doesn't  contain[i, array[index]]
  -increment the value of index
-sort all arrays in pairs by the first and last elements
=end

def twos_difference(lst)
  # your code here
  pairs = []
  current_index = 0

  loop do 
    break if current_index == lst.length

    lst.each do |value|
      next if lst[current_index] == value # don't substract number from self and also since array has no duplicates
      
      if (lst[current_index] - value).abs == 2
        pairs << [lst[current_index], value] if (!pairs.include?[value, lst[current_index]])
      end
    end
    current_index += 1
  end
  pairs.sort_by{|array| [array.first, array.last]}
end

# def twos_difference(lst)
#   lst.sort.combination(2).select { |a, b| b - a == 2 }
# end