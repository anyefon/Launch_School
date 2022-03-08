# -input
#   an array
# - output
#   The same array but with elts all sorted

# Rules
# Continue to make passes on the array until no swap on the final pass

# Algorithm
#  create a boolean variable swap_or_not that's initialized to false
# create a loop with a break condition if swap_or_not is false (or unless swap_or_not is true)
#   create an inner loop that iterates over array
#     Intialize variables first_item and second_item to the first and second elts of array
#     if first_item > second_item, swap items
#     Increment first_item and second_item
#     break if second_item is arr.length - 1 or first_item is arr.length - 2
# return modified array
def bubble_sort!(array)
  last_index = -1
  
  loop do
    index = 0
    swapped = false
    
    if array[last_index] == array.max 
      last_index -= 1
      sub_array = array[0..last_index]
    else
      sub_array = array[0..last_index]
    end 
    
    0.upto(sub_array.size - 2) do |index|
      first, second = array[index], array[index + 1]
      if first > second
        array[index], array[index + 1] = second, first
        swapped = true
      end
    end

    break if !swapped
  end
  
end

array = [5, 3]
bubble_sort!(array)
puts array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
puts array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
puts array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)