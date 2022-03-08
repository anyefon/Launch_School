# input
#  two sorted arrays
# output
#  merged array from two given arrays with elts in sorted order
# rules
#  don't use sort on the result array

# Algorithms
#  intialize result_array to []
#  intialize two counter variables: counter1 and counter2
#  create a loop with break condition counter1 == array1.size && counter2 == array2.size
#   if array1[counter1] is nil, append array2[counter2] to result_array and increment counter2
#   if array2[counter2] is nil, append array1[counter1] to result_array and increment counter1
#   else
#   if array1[counter1] <= array2[counter2]
#     append array1[counter1] to end of result_array
#     increment counter1
#   elsif array2[counter2] <= array1[counter1]
#     append array2[counter2] to end of result_array
#     increment counter2
#  return result_array

def merge(array1, array2)
  result_array = []
  counter1 = 0
  counter2 = 0

  loop do
    break if (counter1 == array1.size) && (counter2 == array2.size)

    if array1[counter1] == nil
      result_array << array2[counter2]
      counter2 += 1
    elsif array2[counter2] == nil
      result_array << array1[counter1]
      counter1 += 1
    else
      if array1[counter1] <= array2[counter2]
        result_array << array1[counter1]
        counter1 += 1
      elsif array2[counter2] <= array1[counter1]
        result_array << array2[counter2]
        counter2 += 1
      end
    end
  end
  result_array
end

puts merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
puts merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
puts merge([], [1, 4, 5]) == [1, 4, 5]
puts merge([1, 4, 5], []) == [1, 4, 5]