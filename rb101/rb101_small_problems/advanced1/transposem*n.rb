# input
#  matrix m*n
# output
#  tranposed matrix

# Algorithm
# 
require "pry"
# def transpose(matrix)
#   transposed_matrix = []

#   0.upto(matrix.size - 1) do |i|
    
#     i.upto(matrix[i].size - 1) do |j|

#       if matrix[j][i] == nil
#         transposed_matrix[j][i] = [matrix[i][j]]
#       else
#         binding.pry
#         transposed_matrix[i][j], transposed_matrix[j][i] = matrix[j][i], matrix[i][j]
#       end
#     end
#   end
#   transposed_matrix
# end

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

puts transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
puts transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
puts transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
puts transpose([[1]]) == [[1]]