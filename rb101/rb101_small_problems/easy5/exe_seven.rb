def word_sizes(text)
  result = {}
  result.default = 0
  text.split.each do |word|
    modified_word = word.gsub(/[^A-Za-z]/, '')
    result[modified_word.size] += 1
  end
  result
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}