=begin
A pangram is a sentence that contains every single letter of the alphabet at least once. 
For example, the sentence "The quick brown fox jumps over the lazy dog" is a pangram, because it 
uses the letters A-Z at least once (case is irrelevant).

Given a string, detect whether or not it is a pangram. Return True if it is, False if not. Ignore 
numbers and punctuation.

input:
-a string
output:
-a boolean true/false
rules:
-ignore numbers and punctuation
-count upcase and lowercase, case is irrelevant
-contain every letter of the alphabet at least once
algorithm:
-create hash 
-for each char in string
  -check if the lowercase of char is in this range /[a-z]/
  -if so, count appearances of char in string and append to hash like this hsh[char.lowercase] = count
-check if hsh has 26 keys, if so return true and false otherwise 
=end

def pangram?(string)
  # enter your code here
  alphabet = {}

  string.each_char do |char|
    if char.match(/[a-zA-Z]/)
      alphabet[char] = (string.count(char.downcase) + string.count(char.upcase))
    end
  end
  alphabet.keys.size == 26 ? true : false
end

# *******better solution******
# def panagram?(string)
#   ('a'..'z').all? { |x| string.downcase.include? (x) } 
# end