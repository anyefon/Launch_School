=begin
Given a non-empty string check if it can be constructed by taking a substring of it and appending multiple 
copies of the substring together. You may assume the given string consists of lowercase letters only.

Example 1:

Input: 'abab'
Output: True
Explanation: It's the substring "ab" twice.

Example 2:

Input: "aba"
Output: False

algorithm:
-initialize string and assign
-create array of substrings
-for each substring check if substring multiplied by count of substring in input equals input.
  - only for substrings whose count is more than 1
- 
=end

# def create_substrings(string)
#   substrings = []

#   0.upto(string.size - 1) do |sidx|
#     sidx.upto(string.size - 1) do |eidx|
#       substrings << string[sidx..eidx]
#     end
#   end
#   substrings
# end

# def check_substrings(substrings, string)
  
#   substrings.any? do |substring|
#     next if substring == string
#     substring * (string.size / substring.size) == string
#   end
# end

# def repeated_substring_pattern(string)
#   substrings = create_substrings(string)
#   any_substrings = check_substrings(substrings, string)
#   any_substrings
# end

# # p repeated_substring_pattern("abab")

# p repeated_substring_pattern("abab") == true
# p repeated_substring_pattern("aba") == false
# p repeated_substring_pattern("aabaaba") == false
# p repeated_substring_pattern("abaababaab") == true
# p repeated_substring_pattern("abcabcabcabc") == true


=begin
Given an array of strings made only from lowercase letters, return an array of all
characters that show up in all strings within the given array (including duplicates).
For example, if a character occurs 3 times in all strings but not 4 times, you need
to include that character three times in the final answer.

Input: an array of strings
output: an array of characters

algorithm:
-split one string into characters
-for each character in strings
-
=end

def common_chars(array)
  characters = []
  letters = array[0].chars

  letters.each do |letter|
    if (array.all?{|word| word.include?(letter) })
      characters << letter
      array = array.map{|word| word.sub(letter, "_")} # array.map{|word| word.sub!(letter, "_")} 
    end
  end
  characters
end

p common_chars(["bella", "label", "roller"]) == ["e", "l", "l"]
p common_chars(["cool", "lock", "cook"]) == ["c", "o"]
p common_chars(["hello", "goodbye", "booya", "random"]) == ["o"]
p common_chars(["aabbaaaa", "ccdddddd", "eeffee", "ggrrrrr", "yyyzzz"]) == []

=begin
Question
You have to create a method that takes a positive integer number and returns the
next bigger number formed by the same digits.

12 === 21
513 === 531
2017 ==> 2017
If no bigger number can be composed using those digits, return -1

9 ==> -1
111 ==> -1
531 ==> -1

input: a number
output: the next big number or -1 if there isn't one

create an array of permutations for the given number (an array of arrays)
map the array of arrays to an array of numbers
select all numbers greater than given number, if returned array is empty, return -1 else return the next big number(minimum value in the returned array)

=end

# def next_bigger_num(num)
#   num_arr = num.digits.reverse
#   permutations = num_arr.permutation(num_arr.size).to_a
#   numbers = permutations.map{|arr| arr.join.to_i}
#   bigger_numbers = numbers.select{|number| number > num}
#   bigger_numbers.empty? ? -1 : bigger_numbers.min
# end

=begin
-For each number find the maximum possible number with the same digits
  -convert to string, split array into digits, sort it, reverse it, join it and convert to integer
-loop from the input number + 1 still the max_num
  -check if current num digits is the same as given input
  -if so return number 
-return -1 if no number was found
=end

# def max_num(number)
#   number.digits.sort.reverse.join.to_i
# end

# def next_bigger_num(number)
#   max_number = max_num(number)

#   (number + 1).upto(max_number) do |num|
#     return num if num.digits.sort == number.digits.sort
#   end
#   return -1
# end

# p next_bigger_num(9) == -1
# p next_bigger_num(12) == 21
# p next_bigger_num(513) == 531
# p next_bigger_num(2017) == 2071
# p next_bigger_num(111) == -1
# p next_bigger_num(531) == -1
# p next_bigger_num(123456789) == 123456798

=begin
************************************************************************************
The maximum sum subarray problem consists in finding the maximum sum of a contiguous 
subsequence in an array of integers:

maxSequence [-2, 1, -3, 4, -1, 2, 1, -5, 4]
-- should be 6: [4, -1, 2, 1]
Easy case is when the array is made up of only positive numbers and the maximum sum
is the sum of the whole array. If the array is made up of only negative numbers, return
0 instead.

Empty array is considered to have zero greatest sum. Note that the empty array is 
also a valid subarray.

Solution
-if array has all negaitive numbers or array is empty, return 0
-create subarrays and store in an array
-map the array of subarrays to an array of sums
-find the maximum value in array of sums
=end

# def create_subarrays(array)
#   sub_arrays = []

#   0.upto(array.size - 1) do |startidx|
#     startidx.upto(array.size - 1) do |endidx|
#       sub_arrays << array[startidx, endidx]
#     end
#   end
#   sub_arrays
# end

# def max_sequence(array)
#   return 0 if array.all?{|num| num < 0}
#   return array.sum if array.all?{|num| num >= 0}
#   sub_arrays = create_subarrays(array)
#   sub_arrays.map{|sub_array| sub_array.sum}.max
# end

# p max_sequence([]) == 0
# p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
# p max_sequence([11]) == 11
# p max_sequence([-32]) == 0
# p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12

=begin
************************************************************************************
Write a method to find the longest common prefix string amongst an array of strings.
If there is no common prefix, return an empty string ""

Example1:
Input: ["flower", "flow", "flight"]
Output: "fl"
Example2:
Input: ["dog", "racecar", "car"]
Output: ""
Explanation: There is no common prefix among the input strings.
Note:

All given inputs are in lowercase letters a-z

-create an array of substrings from one of the strings in the array, probably the first elt.
-loop over this array of substrings (from the longest to the shortest) and find out if any given substring is present in all elements in the input array
-if present, return the longest substring or an empty string 
=end
# my take
# def create_substrings(array)
#   substrings = []

#   (0..((array[0].size) -1)).each do |startidx|
#     (startidx..((array[0].size) - 1)).each do |endidx|
#       substrings << array[0][startidx..endidx]
#     end
#   end
#   substrings
# end

# def common_prefix(array)
#   prefixes = []
#   substrings = create_substrings(array)

#   substrings.each do |substring|
#     prefixes << substring if array.all?{|word| word.include?(substring) && substring.start_with?(array[0][0])}
#   end
#   prefixes.empty? ? "" : prefixes.sort_by{|str| str.size}.last
# end


# method used in video
# get the shortest string in the array, get its size
# iterate from 0 upto this size and compare the character of the shortest string to all characters at the same position in other strings in array
#   if character is present in all strings, append to results array
#   else return results array joined 
# return array joined

# def common_prefix(array)
#   results = []
#   str_len = array.min_by{|str| str.size}.size

#   (0...str_len).each do |num|
#     current_char = array[0][num]
#     if array.all?{|str| str[num] == current_char}
#       results << current_char
#     else
#       return results.join
#     end
#   end
#   results.join
# end

# p common_prefix(["flower", "flow", "fliwht"]) == "fl"
# p common_prefix(["dog", "racecar", "car"]) == ""
# p common_prefix(["interspecies", "interstellar", "interstate"]) == "inters"
# p common_prefix(["throne", "dungeon"]) == ""
# p common_prefix(["throne", "throne"]) == "throne"