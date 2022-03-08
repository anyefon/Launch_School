=begin
Given the array...

Copy Code
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
Write a program that prints out groups of words that are anagrams. Anagrams are words that have the same exact letters in them 
but in a different order. Your output should look something like this:

Copy Code
["demo", "dome", "mode"]
["neon", "none"]

input:
-an array
output:
-groups of anagrams

algorithm:
-create a hash
-iterate over the input array
  -for each word check if all it's letters are all present as  key of the hash
    -if so append word to value of the key
  -else
    - using word as key, create a new key value pair 
-iterate through hash an print out all values 

=end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

def print_anagrams(words)
  hsh = {}
  words.each do |word|
    if hsh[word.chars.sort_by{|letter| letter.ord }.join]
      hsh[word.chars.sort_by{|letter| letter.ord }.join] << word
    else
      hsh[word.chars.sort_by{|letter| letter.ord }.join] = [word]
    end
  end
  hsh
end

p print_anagrams(words)