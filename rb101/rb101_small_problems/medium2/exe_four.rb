def balanced?(string)
  string.scan(/[()]/).size.even? && !string.end_with?('(')
end

puts balanced?('What (is) this?') == true
puts balanced?('What is) this?') == false
puts balanced?('What (is this?') == false
puts balanced?('((What) (is this))?') == true
puts balanced?('((What)) (is this))?') == false
puts balanced?('Hey!') == true
puts balanced?(')Hey!(') == false
puts balanced?('What ((is))) up(') == false

# def balanced?(string)
#   paren = 0

#   string.each_char do |char|
#     paren += 1 if char == '('
#     paren -= 1 if char == ')'

#     break if paren < 0
#   end
#   paren.zero?
# end
