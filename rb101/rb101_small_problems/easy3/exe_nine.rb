def real_palindrome?(str)
  arr_str = str.split('')
  arr_str.select! {|char| /^[a-zA-Z0-9]+$/.match(char)}
  arr_str.join.downcase == arr_str.join.downcase.reverse
end

puts real_palindrome?('madam') == true
puts real_palindrome?('Madam') == true        # (case matters)
puts real_palindrome?("Madam I'm Adam") == true # (all characters matter)
puts real_palindrome?('356653') == true