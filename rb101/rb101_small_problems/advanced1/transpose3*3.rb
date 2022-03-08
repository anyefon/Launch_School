# input
#  a 3*3 array of arrays
# output
#  new array of the same dimensions but transposed

# Algorithm
# create a variable transposed_matrix
# First, make a copy(clone) of the array of arrays
#  create a variable called cloned_arr.
#  for each sub_array in input_arr, append array clone to cloned_arr
# NO NEED TO CLONE MATRIX

# second, create a loop. from 0 upto matrix.size - 1 with accumulator i
#  create an array tranposed_row
#  for each sub_array in matrix, append sub_array[i] to tranposed_row
#  append transposed_row to transposed_matrix

# def get_clone(matrix)
#   new_matrix = []

#   matrix.each do |sub_array|
#     new_matrix << sub_array.clone
#   end

#   new_matrix
# end

def transpose(matrix)
  transposed_matrix = []
  
  0.upto(matrix.size - 1) do |i|
    transposed_row = []

    matrix.each do |sub_array|
      transposed_row << sub_array[i]
    end
    transposed_matrix << transposed_row
  end

  transposed_matrix
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# require "pry"
# # further exploration

# def transpose!(matrix)
#   0.upto(matrix.size - 1) do |i|

#     i.upto(matrix.size - 1) do |j|
#       matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]
#     end
#   end

# end

# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# transpose!(matrix)
# p matrix
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]