def palindrome?(str)
  str == str.reverse
end

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true

def palindromic_arr?(arr)
  arr == arr.reverse
end

puts palindromic_arr?(['a', 'b', 'a']) == true

