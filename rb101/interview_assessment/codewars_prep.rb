=begin
Your goal is to write the group_and_count method, which should receive an array as a unique parameter and return a hash. Empty or nil
 input must return nil instead of a hash. This hash returned must contain as keys the unique values of the array, and as values the counting of 
 each value.


Example usage:


input = [1,1,2,2,2,3]


group_and_count(input)# == {1=>2, 2=>3, 3=>1}

The following methods were disabled:


Array#count

Array#length

=end

# def group_and_count(array)
#   return nil if array == nil || array.empty?

#   hsh = Hash.new(0)
#   array.each do |num|
#     hsh[num] += 1
#   end
#   hsh
# end

# p group_and_count([1,1,2,2,2,3]) == {1=>2, 2=>3, 3=>1}

# p group_and_count([]) == nil

# p group_and_count(nil) == nil

# p group_and_count([1, 7, 5, -1]) == {1=>1, 7=>1, 5=>1, -1=>1}

=begin
Given two arrays a and b write a function comp(a, b) that checks whether the two arrays have the "same" elements, with the same multiplicities. 
"Same" means, here, that the elements in b are the elements in a squared, regardless of the order.


Examples

Valid arrays

a = [121, 144, 19, 161, 19, 144, 19, 11]  

b = [121, 14641, 20736, 361, 25921, 361, 20736, 361]

comp(a, b) returns true because in b 121 is the square of 11, 14641 is the square of 121, 20736 the square of 144, 361 the square of 19, 25921 the 
square of 161, and so on. It gets obvious if we write b's elements in terms of squares:


a = [121, 144, 19, 161, 19, 144, 19, 11]

b = [11*11, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19]

Invalid arrays

If we change the first number to something else, comp may not return true anymore:


a = [121, 144, 19, 161, 19, 144, 19, 11]  

b = [132, 14641, 20736, 361, 25921, 361, 20736, 361]

comp(a,b) returns false because in b 132 is not the square of any number of a.


a = [121, 144, 19, 161, 19, 144, 19, 11]  

b = [121, 14641, 20736, 36100, 25921, 361, 20736, 361]

comp(a,b) returns false because in b 36100 is not the square of any number of a.


Remarks

a or b might be [] (all languages except R, Shell).

a or b might be nil or null or None or nothing (except in Haskell, Elixir, C++, Rust, R, Shell, PureScript).

If a or b are nil (or null or None), the problem doesn't make sense so return false.


Note for C

The two arrays have the same size (> 0) given as parameter in function comp.

=end

# def comp(a, b)
#   return false if a == nil || b == nil

#   a.all?{|i| b.include?(i * i) && a.size == b.size}
# end

# p comp([121, 144, 19, 161, 19, 144, 19, 11], [121, 14641, 20736, 361, 25921, 361, 20736, 361]) == true

# p comp([121, 144, 19, 161, 19, 144, 19, 11] , [132, 14641, 20736, 361, 25921, 361, 20736, 361]) == false

# p comp(nil, [1, 2, 3]) == false

# p comp([1, 2], []) == false

# p comp([1, 2], [1, 4, 4]) == false
=begin
Write a function toWeirdCase (weirdcase in Ruby) that accepts a string, and returns the same string with all even indexed characters 
in each word upper cased, and all odd indexed characters in each word lower cased. The indexing just explained is zero based, so the zero-ith 
  index is even, therefore that character should be upper cased.


The passed in string will only consist of alphabetical characters and spaces(' '). Spaces will only be present if there are multiple words. 
Words will be separated by a single space(' ').

Input:
- a string
Output:
- a string with all even indexed characters upper cased and all odd indexed characters lower cased.
Rules:
-Indexing is zero based
-Spaces do not count when considering the parity of the index of each character

Algorithm
-create an array words
-create another substring str
-split and iterate over words in string
-for each character of each word
  -if index is even, change to upper case and append to str
  -else change to lowercase and append to str
-append str to words array, reintialize str to empty string and repeat for each word in string
-join words in array with space and return

=end
# def weirdcase(string)
#   words = []
#   str = ""

#   string.split.each do |word|
#     word.chars.each_with_index do |char, index|
#       if index.even?
#         str << char.upcase
#       else
#         str << char.downcase
#       end
#     end
#     words << str
#     str = ""
#   end
#   words.join(" ")
# end

# p weirdcase( "String" ) == "StRiNg"

# p weirdcase( "Weird string case" ) == "WeIrD StRiNg CaSe"
=begin
You are given a secret message you need to decipher. Here are the things you need to know to decipher it:


For each word:


the second and the last letter is switched (e.g. Hello becomes Holle)

the first letter is replaced by its character code (e.g. H becomes 72)

Note: there are no special characters used, only letters and spaces


Examples


decipherThis('72olle 103doo 100ya'); // 'Hello good day'

decipherThis('82yade 115te 103o'); // 'Ready set go'

Input:
-an encrypted string
Output:
-a deciphered string

Rules:
-first character is changed to its character code
-second and last characters are switched
-no special characters used. Only letters(upcase and lowercase) and spaces

Data Structure:
-arrays, strings

Algorithm
-create words array
-split string into words
-extract number from word, get its equivalent letter, substitute number with letter
  -create a number variable
  -iterate over word characters and if character is a number, append to number variable
  -convert number to character
  -substitute number part of word with new character
  -append to words array
-join words array with spaces

=end

# def get_number(word)
#   num_str = ""
#   word.each_char do |char|
#     num_str << char if char.to_i.to_s == char
#   end
#   num_str
# end

# def convert_to_char(str)
#   hsh1 = ('a'..'z').zip(97..122).to_h 
#   hsh2 = ('A'..'Z').zip(65..90).to_h
#   if str.to_i >90
#     hsh1.key(str.to_i)
#   else
#     hsh2.key(str.to_i)
#   end
# end

# def decipher_this(string)
#   words = []
#   string.split.each do |word|
#     num_str = get_number(word)
#     char = convert_to_char(num_str)
#     word = word.gsub(num_str, char)
#     if word.size <= 2
#       words << word
#     else
#      words << word[0] + word[-1] + word[2..-2] + word[1]
#     end
#   end
#   words.join(" ")
# end

# p decipher_this("65 119esi 111dl 111lw 108dvei 105n 97n 111ka") == "A wise old owl lived in an oak"

# p decipher_this("84eh 109ero 104e 115wa 116eh 108sse 104e 115eokp") == "The more he saw the less he spoke"

# p decipher_this("84eh 108sse 104e 115eokp 116eh 109ero 104e 104dare") == "The less he spoke the more he heard"

# p decipher_this("87yh 99na 119e 110to 97ll 98e 108eki 116tah 119esi 111dl 98dri") == "Why can we not all be like that wise old bird"

# p decipher_this("84kanh 121uo 80roti 102ro 97ll 121ruo 104ple") == "Thank you Piotr for all your help"

=begin
You are given array of integers, your task will be to count all pairs in that array and return their count.

Notes:

Array can be empty or contain only one value; in this case return 0
If there are more pairs of a certain number, count each pair only once. E.g.: for [0, 0, 0, 0] the return value is 2 (= 2 pairs of 0s)
Random tests: maximum array length is 1000, range of values in array is between 0 and 1000
Examples
[1, 2, 5, 6, 5, 2]  -->  2
...because there are 2 pairs: 2 and 5

[1, 2, 2, 20, 6, 20, 2, 6, 2]  -->  4
...because there are 4 pairs: 2, 20, 6 and 2 (again)

Problem:
-count all pairs in an array and return their count
Rules:
-return 0 if array is empty or contains only one value
-If more pairs of a certain number exists, count each pair only once

Examples: see above 
Data structures:
-hash and array

Algorithm:
-create the pairs local variable
-create an empty hash
-check if array is empty or has one element and return 0 if that's the case
-iterate over input array
  -for each number, count number of occurences in array and append value to hash if it doesn't already have that entry
-select all key-value pairs for which the value is greater than one and assign to duplicates variable
-obtain each value in new hash, divide value by 2 and add the quotient to the pairs local variable
-return the pairs variable
=end

# def pairs(arr)
#   return 0 if arr.empty? || arr.size == 1
#   hsh = {}
#   pairs = 0

#   arr.each do |num|
#     hsh[num] = arr.count(num) if !(hsh[num])
#   end
#   duplicates = hsh.select{|k, v| v > 1}
#   duplicates.values.each{|number| pairs += (number / 2) }
#   pairs
# end

# p pairs([1, 2, 5, 6, 5, 2]) == 2

# p pairs([1, 2, 2, 20, 6, 20, 2, 6, 2]) == 4

# p pairs([0, 0, 0, 0, 0, 0, 0]) == 3

# p pairs([1000, 1000]) == 1

# p pairs([]) == 0

# p pairs([54]) == 0

=begin
Consider the word "abode". We can see that the letter a is in position 1 and b is in position 2. In the alphabet, a and b are also in 
positions 1 and 2. Notice also that d and e in abode occupy the positions they would occupy in the alphabet, which are positions 4 and 5.

Given an array of words, return an array of the number of letters that occupy their positions in the alphabet for each word. For example,

solve(["abode","ABc","xyzD"]) = [4, 3, 1]
See test cases for more examples.

Input will consist of alphabet characters, both uppercase and lowercase. No spaces.

Good luck!

Problem:
-return an array of number of letters that occupy their positionns in the alphabet for each word.
rules:
-input will consist of alphabet characters both uppercase and lowercase. no spaces.
Examples:
-see example given above
Data structure:
-arrays and strings
Algorithm:
-create an array of alphabet characters
-create a string variable word
-create an array variable words
-iterate over the array of strings
-for each item in array
  -change all characters to lowercase
  -check if position in string is the same as position in alphabets array
  -if so append to string variable
-append string to words array
-reintialize string to empty string
-map array of words to array of string size of words
=end

# def solve(arr)
#   alphabets = ('a'..'z').to_a 
#   word = ""
#   words = []
  
#   arr.each do |item|
#     item.chars.each_with_index do |char, index|
#       word << char if index == alphabets.join.index(char.downcase)
#     end
#     words << word
#     word = ""
#   end
#   words.map{|i| i.size}
# end

# p solve(["abode","ABc","xyzD"]) == [4,3,1]

# p solve(["abide","ABc","xyz"]) == [4,3,0]

# p solve(["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"]) == [6,5,7]

# p solve(["encode","abc","xyzD","ABmD"]) == [1, 3, 1, 3]

=begin
The vowel substrings in the word codewarriors are o,e,a,io. The longest of these has a length of 2. Given a lowercase string that has alphabetic 
characters only (both vowels and consonants) and no spaces, return the length of the longest vowel substring. Vowels are any of aeiou.

Problem:
-return the length of the longest vowel substring from the lowercase input string
rules:
-only lowercase characters, both vowels and consonants
-no spaces
Data structure:
-strings and arrays
Algorithm:
-create substrings of the input string
-select substrings with only vowel characters
-find the longest of the selected substrings and return its length/size
=end

# def create_substrings(string)
#   substrings = []

#   0.upto(string.size - 1) do |startidx|
#     startidx.upto(string.size - 1) do |endidx|
#       substrings << string[startidx..endidx]
#     end
#   end
#   substrings
# end

# def find_vowels(array)
#   vowels = ['a', 'e', 'i', 'o','u']

#   array.select do |str|
#     str.chars.all?{|chr| vowels.include?(chr)}
#   end
# end

# def solve(string)
#   substrings = create_substrings(string)
#   vowels = find_vowels(substrings)
#   vowels.max_by{|vowel| vowel.size}.size
# end

# p solve("codewarriors") == 2

# p solve("suoidea") == 3

# p solve("iuuvgheaae") == 4

# p solve("ultrarevolutionariees") == 3

# p solve("strengthlessnesses") == 1

# p solve("cuboideonavicuare") == 2

# p solve("chrononhotonthuooaos") == 5

# p solve("iiihoovaeaaaoougjyaw") == 8

=begin

Given a string of integers, return the number of odd-numbered substrings that can be formed.


For example, in the case of "1341", they are 1, 1, 3, 13, 41, 341, 1341, a total of 7 numbers.


solve("1341") = 7. See test cases for more examples.

=end

# def create_substrings(string)
#   substrings = []

#   0.upto(string.size - 1) do |startidx|
#     startidx.upto(string.size - 1) do |endidx|
#       substrings << string[startidx..endidx] if string[startidx..endidx].to_i.odd?
#     end
#   end
#   substrings
# end

# def solve(string)
#   substrings = create_substrings(string)
#   substrings.size
# end

# p solve("1341") == 7

# p solve("1357") == 10

# p solve("13471") == 12

# p solve("134721") == 13

# p solve("1347231") == 20

# p solve("13472315") == 28

=begin

Complete the function that takes an array of words.


You must concatenate the nth letter from each word to construct a new word which should be returned as a string, where n is the position of the 
word in the list.


For example:


["yoda", "best", "has"]  -->  "yes"

  ^        ^        ^

  n=0     n=1     n=2

Note: Test cases contain valid input only - i.e. a string array or an empty array; and each word will have enough letters.

=end

# def nth_char(arr)
#   str = ""

#   arr.each_with_index do |word, index|
#     str << word[index]
#   end
#   str 
# end


# p nth_char(['yoda', 'best', 'has']) == 'yes'

# p nth_char([]) == ''

# p nth_char(['X-ray']) == 'X'

# p nth_char(['No', 'No']) == 'No'

# p nth_char(['Chad', 'Morocco', 'India', 'Algeria', 'Botswana', 'Bahamas', 'Ecuador', 'Micronesia']) ==  'Codewars'

=begin

For a given nonempty string s find a minimum substring t and the maximum number k, such that the entire string s is equal to t repeated k times. 
The input string consists of lowercase latin letters. Your function should return a tuple (in Python) (t, k) or an array 
(in Ruby and JavaScript) [t, k]


Example #1:

for string

s = "ababab"

the answer is

["ab", 3]

Example #2:

for string

s = "abcde"

the answer is


because for this string "abcde" the minimum substring t, such that s is t repeated k times, is itself.

=end

# def create_substrings(string)
#   substrings = []

#   0.upto(string.size - 1) do |startidx|
#     startidx.upto(string.size - 1) do |endidx|
#       substrings << string[startidx..endidx]
#     end
#   end
#   substrings
# end

# def f(s)
#   substrings = create_substrings(s)

#   substrings.each do |substring|
#     k = s.size / substring.size
#     return [substring, k] if substring * k == s
#   end
# end

# p f("ababab") == ["ab", 3]

# p f("abcde") == ["abcde", 1]
=begin
Complete the greatestProduct method so that it'll find the greatest product of five consecutive digits in the given string of digits.


For example:


greatestProduct("123834539327238239583") // should return 3240

The input string always has more than five digits.

=end


# def create_substrings(n)
#   substrings = []
  
#   0.upto(n.size - 1) do |idx|
#     substrings << n[idx, 5] if n[idx, 5].size == 5 
#   end
#   substrings
# end

# def greatest_product(n)
#   #your code here
#   substrings = create_substrings(n)
#   products = substrings.map{|str| str.chars.map{|i| i.to_i}.reduce(1, :*) }
  
#   products.max
# end

# p greatest_product("123834539327238239583") == 3240

# p greatest_product("395831238345393272382") == 3240

# p greatest_product("92494737828244222221111111532909999") == 5292

# p greatest_product("92494737828244222221111111532909999") == 5292

# p greatest_product("02494037820244202221011110532909999") == 0
=begin

Sherlock has to find suspects on his latest case. He will use your method, dear Watson. Suspect in this case is a person which has something 
not allowed in his/her pockets.


Allowed items are defined by array of numbers.


Pockets contents are defined by map entries where key is a person and value is one or few things represented by an array of numbers (can be nil 
or empty array if empty), example:


pockets = {

  bob: [1],

  tom: [2, 5],

  jane: [7]

}


Write a method which helps Sherlock to find suspects. If no suspect is found or there are no pockets (pockets == nil), the method should return nil.

Problem:
-input: pockets hash and an array 
-output: an array of suspects

rules:
-suspect is someone who has sth that is not allowed in his/her pockets
-allowed iterms are defined by an array of numbers(array passed as argument)
-pocket contents are defined by a hash where person is key and value is a few things represented by an array
-If no suspect is found(meaning all items are allowed i.e allowed items array has all pocket values) or there are no pockets (pockets == nil), 
 method should return nil

Task: check if each person has any thing(value) that doesn't belong in the allowed items array. If that is the case, he/her is a suspect

Data structure: array, hash

Algorithm:
-create an array of suspects
-iterate over the pockets hash and check if all items belong to the allowed items array
-If not all items belong, append key(name) to the suspects array
-return the suspects array
=end

# pockets = {

#   bob: [1],

#   tom: [2, 5],

#   jane: [7]

# }

# def find_suspects(pockets, allowed_items)
#   return nil if pockets == nil
#   suspects = []

#   pockets.each do |key, value|
#     value.each do |item|
#       suspects << key if !(allowed_items.include?(item)) 
#     end
#   end
#   suspects.empty? ? nil : suspects.uniq
# end

# p find_suspects(pockets, [1, 2]) == [:tom, :jane]

# p find_suspects(pockets, [1, 7, 5, 2]) == nil

# p find_suspects(pockets, []) == [:bob, :tom, :jane]

# p find_suspects(pockets, [7]) == [:bob, :tom]
=begin
Given an integer n, find the maximal number you can obtain by deleting exactly one digit of the given number.


Example

For n = 152, the output should be 52;


For n = 1001, the output should be 101.


Input/Output

[input] integer n


Constraints: 10 ≤ n ≤ 1000000.


[output] an integer

=end

# def delete_digit(num)
#   values = []
#   num_str = num.to_s
#   0.upto(num_str.size - 1) do |i|
#     values << (num_str[0, i] + num_str[i + 1..-1]).to_i
#   end
#   p valuescd 
#   values.max
# end

# p delete_digit(152) == 52

# p delete_digit(1001) == 101

# p delete_digit(10) == 1

# checking if a number is a prime number.
# a prime number is a number that is divisible by one and itself.
def is_prime?(num)
  return false if num == 1
  (2..(num - 1)).all?{|i| num % i != 0 }
end
p is_prime?(7) == true
p is_prime?(9) == false
p is_prime?(1) == false



=begin
Write a method that takes an Array of numbers,
and returns an Array with the same number of elements,
and each element has the running total from the original Array.

Examples:

running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []

**Problem Requirements**

**Rules / Requirement/ Boundaries (Check test cases)**

**Explicit**
- def a method
- takes an array of numbers as argument
- return a new array with ssam enumber of elements
- each element is the running total of itself and all the previous elements

**Implicit**
- only positive integers
- single element in given array => new array with the same number
- empty array => empty array

**Special Terms**
- running total : sum of all the previous elements and current element

**Questions**
-

- Input: array of positive integers
- return: array of running totals of the given array

**Data Structures**
- input: array
- Output: array
- Intermediate:
- Storage:

**Algorithm**
- given an array of positive integers
- create an empty array to store the running totals
- For each num in the given array
  - append current num to running_total_ary if its the first element of the array
  - find the sum of current element and the last element stored in the running_totals_ary
  - store the current sum the running total ary

**Implementation details**
- running_totals_ary = []
- iterate through the given array
  - append the current num to running totals ary if current index == 0
  - if index > 0
      - current_sum = current_num + running_totals_ary.last
      - append current_sum
- return running_totals_ary

=end

# def running_total(nums_ary)
#   nums_ary.each_with_object([]) do |current_num, ary|
#     if ary.empty?
#       ary << current_num
#     else
#       ary << current_num + ary.last
#     end
#   end
# end

def running_total(nums_ary)
  ary = []

  nums_ary.reduce(0) do |sum, num|
   ary << sum + num
   sum + num
  end
  ary
end

# def running_total(nums_ary)
#   nums_ary.map.with_index do |_,idx|
#     current_sum = 0
#     counter = 0
#     while counter <= idx
#       current_sum += nums_ary[counter]
#       counter += 1
#     end
#     current_sum
#   end
# end

p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []