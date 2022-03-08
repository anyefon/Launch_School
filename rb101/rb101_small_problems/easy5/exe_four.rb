def swap(str)
  str_arr = str.split(' ')
  str_arr.map do |word|
    tmp = word[0]
    word[0] = word[-1]
    word[-1] = tmp
    word
  end.join(' ')
end

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'