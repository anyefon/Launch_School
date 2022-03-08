# Find the length of the longest substring in the given string that is the same in 
# reverse.

# As an example, If the input was "I like racecars that go fast", the substring
# (racecar) length would be 7.

# If the length of the input string is 0, return value must be 0.

# Example:
# "a" -> 1
# "aab" -> 2
# "abcde" -> 1
# "zzbaabcd" -> 4
# "" -> 0

# rules
# if length of input string is 0, return 0
# are spaces to be ignored?

# Algorithm
# create substrings of palindromes of  the input string
# return the length of the longest substring palindrome if more than one exist

def create_palindrome(string)
  palindromes = []

  (0...string.size).each do |startidx|
    (startidx...string.size).each do |endidx|
      palindromes << string[startidx..endidx] if string[startidx..endidx] == string[startidx..endidx].reverse
    end
  end
  palindromes
end

def longest_palindrome(string)
  return 0 if string.size == 0
  palindromes = create_palindrome(string)
  palindromes.empty? ? 0 : palindromes.max_by{|str| str.size}.size
end

p longest_palindrome("a") == 1
p longest_palindrome("aa") == 2
p longest_palindrome("baa") == 2
p longest_palindrome("aab") == 2
p longest_palindrome("baabcd") == 4
p longest_palindrome("baablkj12345432133d") == 9

=begin
# Given a string of words, you need to find the highest scoring word.

# Each letter of a word scores points according to its position in the alphabet:
# a = 1, b = 2, c = 3 etc.

# You need to return the highest scoring word as a string.

# If two words score the same, return the word that appears earliest in the original string.

# All letters will be lowercase and all inputs will be valid.

p alphabet_score('man i need a taxi up to ubud') == 'taxi'
p alphabet_score('what time are we climbing up the volcano') == 'volcano'
p alphabet_score('take me to semynak') == 'semynak'
p alphabet_score('aa b') == 'aa'

split the string into an array of strings
map the words to their respective scores
  for each letter in word obtain value from hash and add to sum
  return sum for each letter 
find the largest sum in array sums and obtain index from sums array
reference string in array and return
=end

def high(str)
  letters_to_positions = ('a'..'z').zip(1..26).to_h
  words_to_sums = {}
  
  str.split.each do |word|
    sum = 0
    word.each_char do |char|
      sum += letters_to_positions[char]
      
    end
    words_to_sums[word] = sum
  end
  max_sum = words_to_sums.values.max
  words_to_sums.select{|key, value| value == max_sum}.keys.first
end
