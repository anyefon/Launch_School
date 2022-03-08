=begin
Task
Given an array of integers , Find the minimum sum which is obtained from summing each 
Two integers product .

Notes
Array/list will contain positives only .
Array/list will always has even size
Input >> Output Examples
minSum({5,4,2,3}) ==> return (22) 
Explanation:
The minimum sum obtained from summing each two integers product , 5*2 + 3*4 = 22
minSum({12,6,10,26,3,24}) ==> return (342)
Explanation:
The minimum sum obtained from summing each two integers product , 26*3 + 24*6 + 12*10 = 342
minSum({9,2,8,7,5,4,0,6}) ==> return (74)
Explanation:
The minimum sum obtained from summing each two integers product , 9*0 + 8*2 +7*4 +6*5 = 74

input:
-an array containing only positives and even-sized
output:
-min sum of each two integer products

algorithm
-create an array of sums
-create different permutations of the given array
-for each array permutation
  -until array length is zero, remove last two elements and push into a new array
  -for each sub array in new array, multiply the two elements in it and add the result to a 
   running total variable
  -push the running total variable into the array of sums 
-check the array of sums for the minimum value and return it.
=end
require 'pry'

def min_sum(arr)
  #your code here
  sum_arr = []
  permutations_arr = arr.permutation.to_a
  
  permutations_arr.each do |sub_array|
    running_total = 0

    until sub_array.size == 0
      deleted_items = sub_array.pop(2)
      running_total += (deleted_items.first * deleted_items.last)
    end
    sum_arr << running_total
  end
  sum_arr.min
end

puts min_sum([5,4,2,3])