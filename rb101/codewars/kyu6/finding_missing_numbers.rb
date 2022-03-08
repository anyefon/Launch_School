=begin
Background:
You're working in a number zoo, and it seems that one of the numbers has gone missing!

Zoo workers have no idea what number is missing, and are too incompetent to figure it out, so 
they're hiring you to do it for them.

In case the zoo loses another number, they want your program to work regardless of how many numbers 
there are in total.

Task:
Write a function that takes a shuffled list of unique numbers from 1 to n with one element missing 
(which can be any number including n). Return this missing number.

Note: huge lists will be tested.

Examples:
[1, 3, 4]  =>  2
[1, 2, 3]  =>  4
[4, 2, 3]  =>  1

input:
-an array of shuffled list of unique numbers from 1 to n missing one element
output:
-missing element from the list

rules:
-array will be missing only one element
-numbers will start from 1 to n
-numbers are unique, no duplicates

algorithm:
-create an int variable missing_variable
-for each number from 1 upto length of array + 1
  -if number is not a member of input array, assign number to missing_variable
-return missing variable
*****Brute force method*****

*****Quicker method*****
algorithm:
-calculate the sum of elements from 1 to n using this formula n*(n+1)/2
-sum up all the elements in the current array
-subtract the sum from the total i.e total - sum to get the missing element
=end

# def find_missing_number(numbers)
#   # your code here
#   missing_variable = 0
#   1.upto(numbers.size + 1) do |number|
#     missing_variable = number if !(numbers.include?(number))
#   end
#   missing_variable
# end

def find_missing_number(numbers)
  n = numbers.size + 1
  total = (n * (n + 1)) / 2
  sum = numbers.sum
  total - sum
end

p find_missing_number([2, 3, 4])
p find_missing_number([1, 3, 4])
p find_missing_number([1, 2, 4])
p find_missing_number([1, 2, 3])