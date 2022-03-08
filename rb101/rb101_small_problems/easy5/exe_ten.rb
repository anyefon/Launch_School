def print_in_box(str)
  str = str[0..-5] if str.size > 76
  top_bottom = "+" + "-" * (str.size + 2) + "+"
  empty_line = "|" + ' ' * (str.size + 2) + "|"
  text_line = "|" + str.center(str.size + 2) + "|"

  puts top_bottom
  puts empty_line
  puts text_line
  puts empty_line
  puts top_bottom
end

print_in_box('')