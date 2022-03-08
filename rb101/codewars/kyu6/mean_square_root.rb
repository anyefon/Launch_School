=begin
Complete the function that

accepts two integer arrays of equal length
compares the value each member in one array to the corresponding member in the other
squares the absolute value difference between those two values
and returns the average of those squared absolute value difference between each member pair.
Examples
[1, 2, 3], [4, 5, 6]              -->   9   because (9 + 9 + 9) / 3
[10, 20, 10, 2], [10, 25, 5, -2]  -->  16.5 because (0 + 25 + 25 + 16) / 4
[-1, 0], [0, -1]                  -->   1   because (1 + 1) / 2

input:
-two integers of equal length
output:
- an integer or float which is the squares of the absolute value difference b/w corresponding array values
rules:
-output floats for averages that have remainders and integers for values that do not
algorithm:
- create a squares array to house the squares of the difference in corresponding array values
- for each value in array1
  -find the difference b/w this value and the corresponding value in array 2, square it and append to squares
- calculate the sum of the squares array and the length/size
  - if squares % size has not remainder, output an integer for squares sum / size
  - else output squares sum / size converted to a float
=end

def solution (arr1, arr2)
  # enter code here!
  squares = []

  arr1.each_with_index do |a1, index|
    squares << ((a1 - arr2[index]).abs) ** 2
  end
  arr_size = squares.size
  squares.sum % arr_size == 0 ? squares.sum / arr_size : squares.sum / arr_size.to_f
end

# def solution (arr1, arr2)
#   arr1.map.with_index { |n, i| (n - arr2[i]).abs ** 2 }.sum.fdiv(arr1.length)
# end