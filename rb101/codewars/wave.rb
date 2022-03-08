=begin
In this simple Kata your task is to create a function that turns a string into a Mexican Wave. 
You will be passed a string and you must return that string in an array where an uppercase 
letter is a person standing up. 

 1.  The input string will always be lower case but maybe empty.

 2.  If the character in the string is whitespace then pass over it as if it was an empty seat

input:
-a lowercase string which may contain a whitespace or empty string
output:
-an array of strings with one letter capitalized in order to form a wave

rules:
-'pass over' whitespace as if it were an empty seat.
algorithm:
-create an array of strings
-create an intermediate string variable
- loop through each character in string upto to length of string
  -assign string variable to input string
  -if char is empty space, capitalize char at current index
  -else capitalize char at index + 1, increment index by 2.
  -append modified string to array of strings.
  -break if current index is equal to string length
  -print array to screen/output
=end

require "pry"

def wave(str)
  str_arr = []
  index = 0

  loop do 
    break if index == str.length 

    if str[index] == ' '
      index += 1
    else
      str_arr << str[0, index] +  str[index].upcase + str[index + 1, str.length - 1]
      index += 1 
    end
  end
  str_arr
end

wave("hello")

