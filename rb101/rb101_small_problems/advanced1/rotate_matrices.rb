# input
#  a matrix
# output
#  new matrix rotated ninty degs clockwise

# Algorithm
# use the transpose method from the previous exercise
# loop through transposed_method using map and reverse each inner array

def transpose(matrix)
  transposed_matrix = []
  
  matrix.each_with_index do |sub_array, i|

    0.upto(sub_array.size - 1) do |j|
      if transposed_matrix[j] == nil
        transposed_matrix[j] = [matrix[i][j]]
      else
        transposed_matrix[j] << matrix[i][j]
      end
    end
  end

  transposed_matrix
end

def rotate90(matrix)
  transposed_matrix = transpose(matrix)

  rotated_matrix = transposed_matrix.map do |sub_array|
    sub_array.reverse
  end

  rotated_matrix
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2