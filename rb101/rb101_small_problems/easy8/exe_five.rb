def substrings(str)
  result = []
  substr_start = 0

  loop do 
    break if substr_start > str.size - 1

    (substr_start).upto(str.size - 1) do |index|
      result << str[substr_start..index]
    end
    substr_start += 1
  end
  result
end

def is_palindrome?(str)
  str.reverse == str
end

def palindromes(str)
  palindromes_arr = []
  substrings_arr = substrings(str)

  substrings_arr.each do |word|
    if is_palindrome?(word)
      palindromes_arr << word unless word.size == 1
    end
  end

  palindromes_arr
end

puts palindromes('abcd') == []
puts palindromes('madam') == ['madam', 'ada']
puts palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
puts palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]

# Further Exploration
def substrings(str)
  str.gsub!(/[^a-zA-Z0-9]/, '') # remove non-alphanumerics
  result = []
  substr_start = 0

  loop do 
    break if substr_start > str.size - 1

    (substr_start).upto(str.size - 1) do |index|
      result << str[substr_start..index]
    end
    substr_start += 1
  end
  result
end

def is_palindrome?(str)
  str.reverse.downcase == str.downcase # case insensitive
end

def palindromes(str)
  palindromes_arr = []
  substrings_arr = substrings(str)

  substrings_arr.each do |word|
    if is_palindrome?(word)
      palindromes_arr << word unless word.size == 1
    end
  end

  palindromes_arr
end