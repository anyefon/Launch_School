=begin
What is an anagram? Well, two words are anagrams of each other if they both contain the same letters.
For example:

'abba' & 'baab' == true

'abba' & 'bbaa' == true

'abba' & 'abbba' == false

'abba' & 'abca' == false
Write a function that will find all the anagrams of a word from a list. You will be given two inputs a 
word and an array with words. You should return an array of all the anagrams or an empty array if 
there are none. For example:

anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) => ['aabb', 'bbaa']

anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) => ['carer', 'racer']

anagrams('laser', ['lazing', 'lazy',  'lacer']) => []
Note for Go
For Go: Empty string slice is expected when there are no anagrams found.

input:
-a word and an array of words
output:
-an array of all anagrams or an empty array if there are none
algorithm:
-for each word in array,
  -select the words that when split and sorted equals the input word split and sorted

=end

def anagrams(word, words)
  words.select{|str| str.split.sort == word.split.sort }
end