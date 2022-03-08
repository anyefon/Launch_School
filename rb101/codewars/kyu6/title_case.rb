=begin
A string is considered to be in title case if each word in the string is either (a) capitalised 
(that is, only the first letter of the word is in upper case) or (b) considered to be an exception 
and put entirely into lower case unless it is the first word, which is always capitalised.

Write a function that will convert a string into title case, given an optional list of exceptions
 (minor words). The list of minor words will be given as a string with each word separated by a space.
  Your function should ignore the case of the minor words string -- it should behave in the same way 
  even if the case of the minor word string is changed.

###Arguments (Haskell)

First argument: space-delimited list of minor words that must always be lowercase except for the 
first word in the string.
Second argument: the original string to be converted.
###Arguments (Other languages)

First argument (required): the original string to be converted.
Second argument (optional): space-delimited list of minor words that must always be lowercase except 
for the first word in the string. The JavaScript/CoffeeScript tests will pass undefined when this 
argument is unused.
###Example

title_case('a clash of KINGS', 'a an the of') # should return: 'A Clash of Kings'
title_case('THE WIND IN THE WILLOWS', 'The In') # should return: 'The Wind in the Willows'
title_case('the quick brown fox') # should return: 'The Quick Brown Fox'

input:
-a string and minor words string
output:
-modified string in title case with minor words left unchanged except for the first word in string
algorithm:
-create a words array and assign it the string split into words, create minor_words string array too
-make sure all elements in minor words array are lowercase
-map the words array to a new array with each word capitalized
  -if the lowercase of word is found in minor_words array and is not the first word in words, 
    -return word in lowercase
  -else
    -return capitalized word
-join the string with spaces
=end
require "pry"
def title_case(title, minor_words = '')
  words =[]
  minor_words = minor_words.split.map{|mword| mword.downcase}
  title.split.each_with_index do |word, index|
    if minor_words.include?(word.downcase) && index != 0
      words << word.downcase
    else
      words << word.capitalize
    end
  end 
  words.join(" ")
end

p title_case('THE WIND IN THE WILLOWS', 'The In')