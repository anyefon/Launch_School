def reverse_words(words)
  words.split.each {|word| word.reverse! unless !(word.length >= 5)}.join(" ")
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')  