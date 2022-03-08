def penultimate(str)
  str.split[-2]
end

puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'

# Further Exploration
# Edge cases
#  - even number of strings in sentence
#  - sentence contains only one word

def get_middle_word(sentence)
  middle_word = ''
  words_arr = sentence.split

  if words_arr.size.even?
    middle_word << words_arr[(words_arr.size / 2) - 1..(words_arr.size / 2)].join(',')
  else
    middle_word << words_arr[words_arr.size / 2]
  end

  middle_word
end

puts get_middle_word('This is a list of things')
puts get_middle_word('Evermore the things of Heaven')
puts get_middle_word('words')