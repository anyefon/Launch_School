WORDS = %w(zero one two three four five six seven eight nine)

# def word_to_digit(str)
#   str.dup.split.each_with_index do |word, index|
#     word = word[0..-2] if word[-1] =~ /[^a-z]/ # takes care of period at 'four'
#     str.gsub!(word, (WORDS.index(word)).to_s) if WORDS.include?(word) 
#   end
#   str.gsub!(/(?<=\d)(\s)/, '')
#   str.gsub!(/(\d{3})(\d{3})(\d{4})/, '(\1) \2-\3')
# end

def word_to_digit(str)
  WORDS.each_with_index do |word, index|
    str = str.gsub(/\b#{word}\b/, index.to_s)
  end
  str
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') #== 'Please call me at 5 5 5 1 2 3 4. Thanks.'