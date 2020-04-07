def palindromic_number?(num)
  num == num.to_s.chars.reverse.join.to_i
end

puts palindromic_number?(34543) == true
puts palindromic_number?(0345430) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true
