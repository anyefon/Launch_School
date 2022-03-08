=begin
Complete the method which returns the number which is most frequent in the given input array. 
If there is a tie for most frequent number, return the largest number among them.

Note: no empty arrays will be given.

Examples
[12, 10, 8, 12, 7, 6, 4, 10, 12]              -->  12
[12, 10, 8, 12, 7, 6, 4, 10, 12, 10]          -->  12
[12, 10, 8, 8, 3, 3, 3, 3, 2, 4, 10, 12, 10]  -->   3

input:
-an array of numbers
output:
-most frequent number in array, return largest number if there is a tie for most frequent number
data structure:
-hash
algorithm:
-create a hash frequencies
-for each num in array
  -calculate the number of occurences in array and save in hash with number as key and occurences as value
  -check if number as key already exists in hash
-select all key-value pairs for which occurences is highest. That is for which the value is higest
-obtain all keys with this value and find the max of the keys
=end
require 'pry'
def highest_rank(arr)
  # your code here
  frequencies = {}
  arr.each do |num|
    count = arr.count(num)
    frequencies[num] = count if !(frequencies[num])
  end

  maximums = frequencies.select {|key, value| value == frequencies.values.max}
  maximums.keys.max
end

p highest_rank([12, 10, 8, 8, 3, 3, 3, 3, 2, 4, 10, 12, 10])