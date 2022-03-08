=begin
Welcome.

In this kata you are required to, given a string, replace every letter with its position in the alphabet.

If anything in the text isn't a letter, ignore it and don't return it.

"a" = 1, "b" = 2, etc.

Example
alphabet_position("The sunset sets at twelve o' clock.")
Should return "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11" (as a string)

input:
-a string of letters
output:
-a string of numbers
rules:
-ignore everything in the text that isn't a letter and don't return it
-uppercase and lowercase of the same letter should return the same value.

algorithms:
-assign string to a local variable str and substitute all non alphabetical letters with a nothing
-change the string into an array of strings and convert all characters to lowercase
-map the array of strings to an array of ascii values of the letters not forgeting to substract the value of 'a'
-join the resulting array of numbers with spacing between each number string
=end

def alphabet_position(text)
  text = text.gsub(/[^a-zA-Z]/, '')

  text.downcase.chars.map{|char| char.ord - 96 }.join(' ') 
end