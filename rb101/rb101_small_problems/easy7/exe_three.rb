# def word_cap(str)
#   str.split.map(&:capitalize).join(' ')
# end

LETTERS_HSH = Hash['a', 'A', 'b', 'B', 'c', 'C', 'd', 'D', 'e', 'E', 'f', 'F', 'g', 'G', 'h', 'H',
                   'i', 'I', 'j', 'J', 'k', 'K', 'l', 'L', 'm', 'M', 'n', 'N', 'o', 'O', 'p', 'P',
                   'q', 'Q', 'r', 'R', 's', 'S', 't', 'T', 'u', 'U', 'v', 'V', 'w', 'W', 'x', 'X',
                   'y', 'Y', 'z', 'Z']

def word_cap(str)
  cap_words_arr = []
  
  str.split.each do |word|
    word.downcase!
    word[0]= LETTERS_HSH[word[0]] if word[0] =~ /[a-z]/
    cap_words_arr << word
  end
  cap_words_arr.join(' ')
end

puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

# Further Exploration



