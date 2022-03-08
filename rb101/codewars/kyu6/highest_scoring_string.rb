=begin
Given a string of words, you need to find the highest scoring word.

Each letter of a word scores points according to its position in the alphabet: a = 1, b = 2, c = 3 etc.

You need to return the highest scoring word as a string.

If two words score the same, return the word that appears earliest in the original string.

All letters will be lowercase and all inputs will be valid.

input:
-a string of characters
output:
-a highest scoring string
rules:
- all letters will be lowercase and all inputs will be valid
algorithm:
-create an array scores
- break up string at whitespaces and map the array of strings to an array of strings and numbers
  -create a variable called score_points initialized to zero
  -for each char in string
    - get it ascii value and substract 96 from it
    - increment scorepoints by this amount
  - append [string, scorepoints] to the scores array
- sort scores by highest scorepoints
=end

def high(x)
  # Code here
  scores = {}

  x.split.each do |char|
    score_points = 0

    char.each_char do |letter|
      score_points += (letter.ord - 96)
    end
    scores[char] = score_points
  end
  scores.key( scores.values.max)
    
end