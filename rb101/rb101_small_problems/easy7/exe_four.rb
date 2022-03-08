def swapcase(str)
  swapped_letters = []

  str.chars.each do |char|
    if char =~ /[a-z]/
      swapped_letters << char.upcase
    elsif char =~ /[A-Z]/
      swapped_letters << char.downcase
    else
      swapped_letters << char
    end
  end
  swapped_letters.join('')
end

puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'