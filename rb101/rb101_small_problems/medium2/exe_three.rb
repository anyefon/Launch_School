def letter_percentages(str)
  hsh = {lowercase: 0, uppercase: 0, neither: 0}
  
  hsh[:lowercase] = ((str.scan(/[a-z]/).size.to_f / str.size) * 100).round(2)
  hsh[:uppercase] = ((str.scan(/[A-Z]/).size.to_f / str.size) * 100).round(2)
  hsh[:neither] = ((str.scan(/[^a-zA-Z]/).size.to_f / str.size) * 100).round(2)
  hsh
end

puts letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
puts letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
p letter_percentages('abcdefGHI')