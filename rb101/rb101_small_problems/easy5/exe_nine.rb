# def crunch(str)
#   char_arr = []
#   str.chars.each{|char| char_arr << char unless char == char_arr.last } 
#   char_arr.join('')
# end

def crunch(text)
  clean_text = ''

  text.chars.each do |char|
    clean_text << char unless char == clean_text[-1]
  end
  clean_text
end


puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba' 
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''

