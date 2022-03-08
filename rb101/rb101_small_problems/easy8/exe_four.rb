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


puts substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]