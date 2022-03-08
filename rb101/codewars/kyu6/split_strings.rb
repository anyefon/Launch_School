=begin
Complete the solution so that it splits the string into pairs of two characters. If the string 
contains an odd number of characters then it should replace the missing second character of the final 
pair with an underscore ('_').

Examples:

solution('abc') # should return ['ab', 'c_']
solution('abcdef') # should return ['ab', 'cd', 'ef']

input:
-a string
output:
-an array of strings
algorithm:
-check if string has an odd length, if so append "_" to the end
-create a variable letters and assign an empty string
-create array arr
-for each char in string
  -if letters length is less than 2
    - append char to letters
  -else
    - append letters to arr
    - reassign empty string to letters
-return arr
=end

require 'pry'
def solution(str)
  letters = ""
  arr = []

  str << "_" if str.length.odd?
  str.each_char do |char|
    if letters.length < 2
      letters << char
    else
      arr << letters
      letters = char
    end
  end
  arr << letters
  arr
end

p solution("abcdef")