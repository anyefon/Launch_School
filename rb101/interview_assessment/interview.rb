# Create a method that reverses digits in a string but keeps letter
# characters in their current order.

# Examples:

# input - string
# output- string
# rules- reverse the numerics in the string leaving the letters in place

# data structure array, string
# algorithm
# -iterate through the given string
# -check for numerics and append to an array
# - reverse the array 
# # - iterate over the string and substitute each digit with the corrresponding value in the array
def reverse(str)
  numbers = []
  new_str = ""
  str.each_char do |chr|
    numbers << chr if chr.to_i.to_s == chr
  end
  numbers = numbers.reverse
  str.each_char do |char|
    if char.to_i.to_s == char
      new_str << numbers.shift
    else
      new_str << char
    end
  end
  new_str
end

p reverse("ab89c") == "ab98c"
p reverse("jkl5mn923o") == "jkl3mn295o"
p reverse("123a45") == "543a21"

# The tests above should print "true".

# ab89c

# char = 8
# ab89c - substitute every occurence of 8 with the first element in the reversed array (shift)

# char = 9
# ab99c - substitute every occurence of 9 with the first element in the reversed array (shift)

# --> ab88c


=begin

Background
There is a message that is circulating via public media that claims a reader can easily read a message where the inner letters of each words is scrambled, as long as the first and last letters remain the same and the word contains all the letters.

Another example shows that it is quite difficult to read the text where all the letters are reversed rather than scrambled.

In this kata we will make a generator that generates text in a similar pattern, but instead of scrambled or reversed, ours will be sorted alphabetically

Requirement
return a string where:

1) the first and last characters remain in original place for each word
2) characters between the first and last characters must be sorted alphabetically
3) punctuation should remain at the same place as it started, for example: shan't -> sahn't

Assumptions

1) words are seperated by single spaces
2) only spaces separate words, special characters do not, for example: tik-tak -> tai-ktk
3) special characters do not take the position of the non special characters, for example: -dcba -> -dbca
4) for this kata puctuation is limited to 4 characters: hyphen(-), apostrophe('), comma(,) and period(.)
5) ignore capitalisation





=end

=begin

**Problem Requirements**

**Rules / Requirement/ Boundaries (Check test cases)**

**Explicit**
-input is a string
-output is a string
  -first and last characters of each word remain in place
  -characters b/w the first and last chars should be sorted alphabetically
  -punctuation should retain its position
**Assumptions**
-only single spaces separate words, special characters don't
-The characters that remain unchanged shouldn't be special characters, a-zA-Z
- four punctuations: hyphen(-), apostrophe('), comma(,) and period(.)
-ignore capilization

**Implicit**
- assume words will only be separated by single spaces
- alphabetic characters only
- return an empty if input string is empty
- convert all cases to lowercase

**Special Terms**
-special characters - hyphen, apostrophe, comma and period
-non special characters - normal alphabetic chars

**Questions**
-what are special characters?

- Input: string
- Output/return: string

**Data Structures**
- input:
- Output:
- Intermediate:string
- Storage:array

**Algorithm**
-split the string into individual words
-obtain the first and last non special characters of the string
-obtain any special characters within the string
-get the characters b/w the first and last chars
-sort them alphabetically
-iterate through each, retain 

**Implementation details**
-

=end

p scramble_words('i') == 'i'
p scramble_words('') == ''
p scramble_words('me') == 'me'
p scramble_words('you') == 'you'
p scramle_words('y-u') == 'y-u'


p scramble_words('professionals') == 'paefilnoorsss'
p scramble_words('dcba.') == 'dbca.'


p scramble_words('card-carrying') == 'caac-dinrrryg'
p scramble_words("shan't") == "sahn't"
p scramle_words('y-ou') == 'y-ou'

p scramble_words('-dcba') == '-dbca'

p scramble_words("you've gotta dance like there's nobody watching, love like you'll never be hurt, sing like there's nobody listening, and live like it's heaven on earth.") == "you've gotta dacne like teehr's nbdooy wachintg, love like ylo'ul neevr be hrut, sing like teehr's nbdooy leiinnstg, and live like it's haeevn on earth."


=begin
Write a method that takes a string as an argument and groups the number of times each character appears in the string as a hash.

The characters should be sorted alphabetically.
You should ignore spaces, special characters and count uppercase letters as lowercase ones.

Example Test Cases:
=end

p get_char_count("cba") == { 1 => ["a", "b", "c"] }
p get_char_count("Mississippi") == { 4 => ["i", "s"], 2 => ["p"], 1 => ["m"] }
p get_char_count("Hello. Hello? HELLO!!") == { 6 => ["l"], 3 => ["e", "h", "o"] }
p get_char_count("aaa...bb...c!") == { 1 => ["c"], 2 => ["b"], 3 => ["a"] }

p get_char_count("aaabbbccc") == { 3 => ["a", "b", "c"] }
p get_char_count("abc123") == { 1 => ["1", "2", "3", "a", "b", "c"] }
p get_char_count("") == {}
p get_char_count("...$*,+") == {}

=begin
Given an Array of Integers, return all pairs of integers that have a difference of 2.
The result array should be sorted in ascending order of values.
Assume there are no duplicate integers in the array.
The order of the integers in the input array should not matter.
=end

=begin
Given an Array of Integers, return all pairs of integers that have a difference of 2.
The result array should be sorted in ascending order of values.
Assume there are no duplicate integers in the array.
The order of the integers in the input array should not matter.

Write a function that will find all the anagrams of a word from a list. 
You will be given two inputs a word and an array with words. 
You should return an array of all the anagrams or an empty array if there are none. 

anagrams('abba', ['aabb', 'abcd', 'bbaa', 'dada']) => ['aabb', 'bbaa']

anagrams('racer', ['crazer', 'carer', 'racar', 'caers', 'racer']) => ['carer', 'racer']

anagrams('laser', ['lazing', 'lazy',  'lacer']) => []
=end
#**************************************************************************************************

=begin

**Problem Requirements**
**Explicit**
-return a hash that contains groups of the number of times each character
 appears in the input string

**Questions**

**Implicit**
-assume that a non-empty string will be provided
-the hash will have the count as key and an array of chars as value
-all chars in value should be lowercase characters

**Rules / Requirement/ Boundaries (Check test cases)**
-ignore spaces, special characters
-count uppercase letters as lowercase ones.


**Data Structures**
- input: string
- Output: hash
- Intermediate:
- Storage:

**Algorithm**
-iterate over the input string provided
-check if character is a valid alphabet char and count the number of occurences in input string
-return the hash

**Implementation details**
-iterate over the input string provided
  -initialize a hash counts
  -for each char in input string, check if it is in the range a-zA-Z
-check if character is a valid alphabet char and count the number of occurences in input string
  -if valid char
    -initialize the variable called count
    -check if it is a valid character
      -count all occurences of char in input string
      -check if count is already present as key in hash
        -if so, reference value of hash corresponding to key and append new char if char is not already present in array
        -sort the value alphabetically
      -if not present
        -create a new key-value pair with count as key and array of char as  value
-return the hash
=end

# def get_char_count(str)
#   counts = {}
#   count = 0
  
#   str.each_char do |char|
#     if ('a'..'z').include?(char.downcase)
#       count = str.downcase.count(char.downcase)
#       if counts[count]
#         counts[count] << char.downcase if !(counts[count].include?(char.downcase))
#         counts[count].sort!
#       else
#         counts[count] = [char.downcase]
#       end
#     end
#   end
#   counts
# end

# p get_char_count("cba") == { 1 => ["a", "b", "c"] }
# p get_char_count("Mississippi") == { 4 => ["i", "s"], 2 => ["p"], 1 => ["m"] }
# p get_char_count("Hello. Hello? HELLO!!") == { 6 => ["l"], 3 => ["e", "h", "o"] }
# p get_char_count("aaa...bb...c!") == { 1 => ["c"], 2 => ["b"], 3 => ["a"] }

# p get_char_count("aaabbbccc") == { 3 => ["a", "b", "c"]}

#**************************************************************************************************
=begin
A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits. 
For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be 
returned as-is.

Note: underscores are used for clarity above. Ruby lets you use underscores when writing long numbers; however, it does not print the 
underscores when printing long numbers. Don't be alarmed if you don't see the underscores when running your tests.
=end

=begin
**Problem Requirements**
**Definitions**
- a double number is a number with an even number of digits whose left_side digits are exactly the same as its right-side digits
**Explicit**
-return 2 times the number provided as an argument, unless the argument is a double
  number, 
-return double number as-is.
**Questions**

**Implicit**
-numbers are all decimals
-only numbers as inputs
**Rules / Requirement/ Boundaries (Check test cases)**

**Data Structures**
input:
-integer
output:
-integer
intermediate
-array

**Algorithm**
-determine if input number is a double number
-return 2 times number if it is NOT a double or same number if it is
**Implementation details**
-determine if input number is a double number
  -initialize a variable called digits to an array of the digits in number
  -initialize a variable length to the size of that array
  -determine if number is a double (helper method)
    -calculate half the value of length
    -initialize the first half of digits to a var left
      - array[0..(lenght / 2) - 1]
    -initialize the second half of digits to var right
      - array[length / 2 ..-1]
    -check if left == right && size of array is even
-return 2 times number if not double or number as is
=end
def double?(num)
  digits = num.digits.reverse
  length = digits.size
  return false if length <= 1
  
  left = digits[0..(length/2) - 1]
  right = digits[(length/2)..-1]
  left == right && length.size.even?
end

def twice(num)
  double?(num) ? num : 2 * num
end
p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10

# Given a string, write a method `palindrome_substrings` which returns
# all the substrings from a given string which are palindromes. Consider
# palindrome words case sensitive.

# Test cases:

# palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
# palindrome_substrings("abcd dcba") == ["bcddcb", "cddc", "dd", abcd dcba", "d d", cd  dc]
# palindrome_substrings("palindrome") == []
# palindrome_substrings("") == []

=begin
**Problem Requirements**

**Explicit**
- Given a string
- def a method `palindrome_substrings
- returns all the substring from the given string in an array
- which are palindromes
- consider palidrome words are case senstive
- 
word is case sensitive e:g "abcddcbA"

**Questions**
what is palindrome? word that reads the same forward and backward

**Implicit**
- return an empty array if input is an empty string
-
**Rules / Requirement/ Boundaries (Check test cases)**

**Data Structures**

input: a string
output: an array of palindromes for the input string


**Algorithm**

-create all substrings for the given string
-iterate over the substrings and check if substring is a palindrome
-return an array of palindromes


**Implementation details**

-create an array of palindromes
-create all substrings for the given string
   iterate from 0..str.size -1 for starting index
    iterate from starting_index up to the str.size -1  for stopping index
      get the substring for current_starting_index upto the current_stop_index 
    - append substring to the substrings array
-iterate over the substrings and check if substring is a palindrome
  -check if substring and substring reversed are the same
  -eliminate all single character palindromes
  -append substring to palindromes if it is a palindrome
-return palindromes array
=end

def create_substrings(str)
  substrings = []
  
  (0..str.size - 1).each do |startidx|
    (startidx..str.size - 1).each do |stopidx|
      substrings << str[startidx..stopidx] if str[startidx..stopidx].size > 1
    end
  end
  substrings
end

def palindrome?(substrings)
  substrings.select do |substring|
    substring == substring.reverse 
  end
end

def palindrome_substrings(str)
  substrings = create_substrings(str)
  palindromes = palindrome?(substrings)
end

p palindrome_substrings("supercalifragilisticexpialidocious") == ["ili"]
p palindrome_substrings("abcddcbA") == ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome") == []
p palindrome_substrings("") == []

# You are going to be given an array of integers.
#Your job is to take that array and find an index N where the sum of the integers to the left of N
#is equal to the sum of the integers to the right of N. If there is no index that would make this happen,
#return -1.


# p find_even_index([1,2,3,4,3,2,1]) == 3
# p find_even_index([1,100,50,-51,1,1]) == 1
# p find_even_index([1,2,3,4,5,6]) == -1
# p find_even_index([20,10,30,10,10,15,35]) == 3
# p find_even_index([20,10,-80,10,10,15,35]) == 0
# p find_even_index([10,-80,10,10,15,35,20]) == 6
# p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3

