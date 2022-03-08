=begin
The marketing team is spending way too much time typing in hashtags.
Let's help them with our own Hashtag Generator!

Here's the deal:

It must start with a hashtag (#).
All words must have their first letter capitalized.
If the final result is longer than 140 chars it must return false.
If the input or the result is an empty string it must return false.
Examples
" Hello there thanks for trying my Kata"  =>  "#HelloThereThanksForTryingMyKata"
"    Hello     World   "                  =>  "#HelloWorld"
""                                        =>  false

input:
-a string
output:
-a hashtag string
rules:
-output must start with a hashtag
-all words must have their first letter capitalized
-If final results is longer than 140 chars it must return false(the boolean)
-If the input or the result is an empty string it must return false(the boolean)
-Eliminate all whitespaces 
algorithm:
-check if input is an empty string or string of zero length and return false if that is the case
-break string up at the whitespaces, map the current strings to an array of strings with first letter
 capitalize
-Then proceed to join the strings without any spaces in between
-if the newly created string is longer than 140 chars, return false
-append a hashtag to the start of the string an return it
=end

def generateHashtag(str)
  # ...
  return false if str.match(/[^a-zA-Z]/)
  hashtag = str.split.map{|string| string.capitalize}.join
  return false if hashtag.length > 140
  hashtag = "#" + hashtag
end

# def generateHashtag(str)
#   hashtag = '#' + str.scan(/\w+/).map(&:capitalize).join
#   hashtag.length.between?(2, 140) ? hashtag : false
# end

# def generateHashtag(str)
#   str = "#" << str.split.map(&:capitalize).join
#   str.size <= 140 && str.size > 1 ? str : false
# end