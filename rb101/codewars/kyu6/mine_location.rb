=begin
You've just discovered a square (NxN) field and you notice a warning sign. 
The sign states that there's a single bomb in the 2D grid-like field in front of you.

Write a function mineLocation/MineLocation that accepts a 2D array, and returns the location of 
the mine. The mine is represented as the integer 1 in the 2D array. Areas in the 2D array that are 
not the mine will be represented as 0s.

The location returned should be an array (Tuple<int, int> in C#) where the first element is the row 
index, and the second element is the column index of the bomb location (both should be 0 based). 
All 2D arrays passed into your function will be square (NxN), and there will only be one mine in 
the array.

Examples:
mineLocation( [ [1, 0, 0], [0, 0, 0], [0, 0, 0] ] ) => returns [0, 0]
mineLocation( [ [0, 0, 0], [0, 1, 0], [0, 0, 0] ] ) => returns [1, 1]
mineLocation( [ [0, 0, 0], [0, 0, 0], [0, 1, 0] ] ) => returns [2, 1]

input:
-an array of arrays 
output:
-coordinate, an array
rules:
-input array of arrays will be a square
-locations are zero-based
-first element in returned array is the row index, an second element is the column index
-there will be only one mine in the array
[
  [1, 0, 0], 
  [0, 0, 0],  ---->[0,0]
  [0, 0, 0] ]

  [ [0, 0, 0],
    [0, 1, 0], ---->[1, 1]
    [0, 0, 0] ]

  [ [0, 0, 0],
    [0, 0, 0], ----->[2, 1]
    [0, 1, 0] ]   
    rows  -->horizontal
    columns --> vertical
algorithm:
-create a variable called coordinates
-for each element in outer array
  -for each element in inner array
    -if element is non zero, return its index and assign to coordinates
-return coordinates
=end
def mineLocation field
  #TODO
  coordinates = []
  field.each_with_index do |array, row|
    array.each_with_index do |item, column|
      coordinates << (row, column) if item == 1
    end
  end
  coordinates
end