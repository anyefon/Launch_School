# 33: def minSubLength(array, target)
# 34:   iterations_array = []
# 35:   array.each.with_index do |num1, idx1|
# 36:     sum = 0
# 37:     iterations = 0
# 38:     array.each do |num2, idx2|
# => 39:       next if idx2 < idx1
# 40:         sum += num2
# 41:         iterations += 1
# 42:         if sum >= target
# 43:           iterations_array << iterations
# 44:           break 
# 45:         end
# 46:       end
# 47:     end
# 48: 
# 49:   iterations_array.empty? ? 0 : iterations_array.min
# 50: en

# def test(b)
#   b.map{|letter| "I like the letter :#{letter}"}
# end

# a = ['a', 'b', 'c']
# test(a)
# p a
# require "pry"
# def prefix(str)
#   "Mr " << str
#   binding.pry
# end

# name = "Joe"
# prefix(name)
# p name


# Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous 
# subarray of which the sum ≥ s. If there isn't one, return 0 instead.

# input: an integer and a positive integer s
# output: minimal length of a contiguoius subarray of which sum >= s, return 0 otherwise
# create an array of subarrays

# create subarrays

# def create_subarrays(array)
#   sub_arrays = []
#   0.upto(array.size - 1) do |start_index|
#     start_index.upto(array.size - 1) do |end_index|
#       sub_arrays << array[start_index, end_index]
#     end
#   end
#   sub_arrays
# end

# def minSubLength(array, s)
#   sub_arrays = create_subarrays(array)
#   sub_arrays.select! do |sub_array|
#     sub_array.sum >= s
#   end
#   arrays = sub_arrays.sort_by{|array| array.length}
#   arrays.empty? ? 0 : arrays[0].size
# end

# # p create_subarrays([2,3,1,2,4,3])
# p minSubLength([2,3,1,2,4,3], 7) 
# # p minSubLength([1, 10, 5, 2, 7], 9) == 1
# # p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
# # p minSubLength([1, 2, 4], 8) == 0

# p minSubLength([2,3,1,2,4,3], 7) == 2
# p minSubLength([1, 10, 5, 2, 7], 9) == 1
# p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
# p minSubLength([1, 2, 4], 8) == 0

# You are given an array strarr of strings and an integer k. Your task is to return the first longest string consisting of k consecutive 
# strings taken in the array.
# #Example: longest_consec(["zone", "abigail", "theta", "form", "libe", "zas", "theta", "abigail"], 2) --> "abigailtheta"
# n being the length of the string array, if n = 0 or k > n or k <= 0 return "".

# input: an array of strings and integer k
# output: longest string made of k consecutive strings
# rules:
=begin
`- if the string arrray n is empty, return ""
 - if k is greater than the length of the string or k is less than or equal zero, return an empty string.
 
get k consecutive longest strings
=end
# create array of consecutive sub_arrays of length k
# sort elements with longest length/size
# join sub_array and return it

def get_subarrays(strarr, k)
  sub_arrays = []
  0.upto(strarr.size - 1) do |index|
    sub_arrays << strarr[index, k]
  end
  sub_arrays
end

def sort_longest(sub_arrays)
  sub_arrays.sort_by{|sub_array| sub_array.join.length}
end

def longest_consec(strarr, k)
  return "" if strarr.size == 0 || k > strarr.size || k <= 0
  sub_arrays = get_subarrays(strarr.uniq, k)
  longest = sort_longest(sub_arrays)
  longest.last.join
end

p longest_consec(["zone", "abigail", "theta", "form", "libe", "zas", "theta", "abigail"], 2) == "abigailtheta"
p longest_consec(["a", "ab", "abc", "d", "ee", "abcde", "bbb"], 6) == "ababcdeeabcdebbb"
p longest_consec(["zone", "abigail", "theta", "form", "libe", "zas"], 2) == "abigailtheta"
p longest_consec(["ejjjjmmtthh", "zxxuueeg", "aanlljrrrxx", "dqqqaaabbb", "oocccffuucccjjjkkkjyyyeehh"], 1) == "oocccffuucccjjjkkkjyyyeehh"
p longest_consec([], 3) == ""
p longest_consec(["itvayloxrp","wkppqsztdkmvcuwvereiupccauycnjutlv","vweqilsfytihvrzlaodfixoyxvyuyvgpck"], 2) == "wkppqsztdkmvcuwvereiupccauycnjutlvvweqilsfytihvrzlaodfixoyxvyuyvgpck"
p longest_consec(["wlwsasphmxx","owiaxujylentrklctozmymu","wpgozvxxiu"], 2) == "wlwsasphmxxowiaxujylentrklctozmymu"
p longest_consec(["zone", "abigail", "theta", "form", "libe", "zas"], -2) == ""
p longest_consec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 3) == "ixoyx3452zzzzzzzzzzzz"
p longest_consec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 15) == ""
p longest_consec(["it","wkppv","ixoyx", "3452", "zzzzzzzzzzzz"], 0) == ""
