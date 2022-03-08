=begin
Pirates have notorious difficulty with enunciating. They tend to blur all the letters together and 
scream at people.

At long last, we need a way to unscramble what these pirates are saying.

Write a function that will accept a jumble of letters as well as a dictionary, and output a 
list of words that the pirate might have meant.

For example:

grabscrab( "ortsp", ["sport", "parrot", "ports", "matey"] )
Should return ["sport", "ports"].

Return matches in the same order as in the dictionary. Return an empty array if there are no matches.

Good luck!
input:
-a jumble of letters and a dictionary (array)
output:
-list of words that the pirate might have meant
rules:
-return matches as the appear in the dictionary

algorithm:
-create a variable called permutations and assign to it all the permutations of the given string
-create an array called words
-for each string in dictionary
  -check if string is in permutations and append to the words array
-return words
****above algorithm is memory intensive****
algorithm:
-create an array called words
-for each word in dictionary
  -split it, sort it and compare to the given string split and sorted
  -if the two arrays equate each other, then append word to words array
-return words array
=end
# *****inefficient first solution*****
# def grabscrab anagram, dictionary
#   # ...
#   permutations = anagram.chars.permutation.to_a.map{|array| array.join}
#   words = []
#   dictionary.each do |word|
#     words << word if permutations.include?(word)
#   end
#   words
# end

# def grabscrab anagram, dictionary
#   # ...
#   words = []
#   dictionary.each do |word|
#     words << word if word.chars.sort == anagram.chars.sort
#   end
#   words
# end

# ***even better solution***
def grabscrab anagram, dictionary
  dictionary.select{|w| anagram.chars.sort == w.chars.sort}
end