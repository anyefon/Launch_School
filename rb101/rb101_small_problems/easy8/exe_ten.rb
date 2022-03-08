def center_of(str)
  middle_chars = ''
  str_size = str.size

  if str_size.even?
    middle_chars << str[(str_size/2)-1..str_size/2]
  else
    middle_chars << str[str_size/2]
  end

  middle_chars
end

puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'