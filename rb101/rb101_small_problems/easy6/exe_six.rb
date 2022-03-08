def merge(arr1, arr2)
  (arr1 + arr2).uniq
end

puts merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

# other solutions
def merge(first_arr, second_arr)
  ( first_arr + second_arr ).uniq
end

# Version 2
def merge(first_arr, second_arr)
  first_arr.concat(second_arr).uniq
end

# Version 3 
def merge(first_arr, second_arr)
  first_arr.zip(second_arr).flatten.uniq.sort
end