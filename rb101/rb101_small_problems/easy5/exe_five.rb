def cleanup(sentence)
  char_arr = sentence.split('')
  modified_char_arr = char_arr.map do |char|
    if /^[a-z]$/.match(char)
      char
    else
      char = ' '
    end
  end
  modified_char_arr.join.squeeze
end

puts cleanup("---what's my +*& line?") == ' what s my line '