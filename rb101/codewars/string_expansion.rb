=begin
Given a string that includes alphanumeric characters ('3a4B2d') return the expansion of
 that string: The numeric values represent the occurrence of each letter preceding that 
 numeric value. There should be no numeric characters in the final string. Empty strings 
 should return an empty string.

The first occurrence of a numeric value should be the number of times each character 
behind it is repeated, until the next numeric value appears.

string_expansion('3D2a5d2f') == 'DDDaadddddff'
string_expansion('3abc') == 'aaabbbccc'       # correct
string_expansion('3abc') != 'aaabc'           # wrong
string_expansion('3abc') != 'abcabcabc'       # wrong

If there are two consecutive numeric characters the first one is ignored.

string_expansion('3d332f2a') == 'dddffaa'
If there are two consecutive alphabetic characters then the first character has no effect 
on the one after it.

string_expansion('abcde') == 'abcde'
Your code should be able to work for both lower and capital case letters.

string_expansion('') == ''

input:
-an alphanumeric string or empty
output:
-an expanded string with no numbers in it

rules:
-the numeric value represents the number of times each character should appear in the expanded
string
-the closest numeric to the string is the one considered, the others ignored
-characters are independent of each other, both cases
-an empty string should return an empty string

algorithm
-create a new string expanded_str
-for each character in the input
  -check if it is a number
    -if it is a number, assign it to a variable current_number
  -if not, 
    -multiply the current_number value by the current character, then append it to the 
     expanded_str array
-join the expanded_str array and return it
=end

# def string_expansion(s)
#   multiple = 1
#   s.chars.each_with_object([]) do |char, str|
#     char =~ /[0-9]/ ? multiple = char.to_i : str << char * multiple
#   end
#    .join
# end
# a better solution
require 'pry'
def string_expansion(s)
  #..
  expanded_str = []
  current_number = 1

  s.chars.each do |char|
    
    if char.to_i.to_s == char
      current_number = char.to_i
    else
      expanded_str << char * current_number
    end
  end
  expanded_str.join
end

puts string_expansion('3abc') 
puts string_expansion('3D2a5d2f') == 'DDDaadddddff'