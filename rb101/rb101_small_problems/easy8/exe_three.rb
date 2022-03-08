def substrings_at_start(str)
  result = []

  str.size.times do |index|
    result << str[0..index]
  end
  result
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
puts substrings_at_start('a') == ['a']
puts substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

def substrings_at_start(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end



def substrings_at_start(str)
  chars_arr = str.split('')
  substrings_arr = []

  chars_arr.each_with_index do |char, index|
    substrings_arr << chars_arr[0..index].join
  end

  substrings_arr
end