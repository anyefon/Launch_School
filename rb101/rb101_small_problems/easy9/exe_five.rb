def uppercase?(str)
  str.gsub!(/[^a-z]/i, '')
  str.split('').all?{|char| char == char.upcase }
end

puts uppercase?('t') == false
puts uppercase?('T') == true
puts uppercase?('Four Score') == false
puts uppercase?('FOUR SCORE') == true
puts uppercase?('4SCORE!') == true
puts uppercase?('') == true

def uppercase?(string)
  string == string.upcase
end

def uppercase?(str)
  !str.upcase!
end

# upcase! returns nil if all chars are uppercased. ! makes it a boolean with and inverses its parity