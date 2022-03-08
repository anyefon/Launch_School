def word_sizes(words)
  words.split.each_with_object({}) do |word, hsh|
    if hsh.key?(word.size)
      hsh[word.size] += 1
    else
      hsh[word.size] = 1
    end
  end
end

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
puts word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
puts word_sizes('') == {}