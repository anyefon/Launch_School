def short_long_short(str1, str2)
  arr_str = [str1, str2].sort_by {|word| word.length }
  arr_str = arr_str << arr_str[0]
  arr_str.join
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"
