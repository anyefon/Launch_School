=begin
Write a function that takes in a string of one or more words, and returns the same string, 
but with all five or more letter words reversed (like the name of this kata).

Strings passed in will consist of only letters and spaces.
Spaces will be included only when more than one word is present.
Examples:

spinWords("Hey fellow warriors") => "Hey wollef sroirraw" 
spinWords("This is a test") => "This is a test" 
spinWords("This is another test") => "This is rehtona test"

input:
-a string
output:
-a string with all five or more letter words reversed 
rules:
-strings passed in will consist of only letters and spaces
-spaces will be included only when more than one word is present
algorithm
-split string and place into an array
-for each letter in the string array
  -if letter length is more than or equal to five
    -split letter into characters, place to array, reverse array and join with no spaces
-join the resulting array with spaces
=end

def spin_words(string)
  #TODO
  string.split.map do |letter|
    next if letter.split("").length < 5
    letter.split("").reverse.join("")
  end.join(" ")
end

# def spinWords(string)
#   string.split.map { |s| s.length >= 5 ? s.reverse : s }.join ' '
# end