statement = "The Flintstones Rock"

# char_arr = statement.split('')
# char_arr.delete(' ')

# char_hsh = char_arr.each_with_object({}) do |char, hsh|
#   if hsh.key?(char) == true
#     hsh[char] += 1
#   else
#     hsh[char] = 1
#   end
# end
# this is my own solution

char_hsh = {}

letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  if letter_frequency > 0
    char_hsh[letter] = letter_frequency
  end
end

p char_hsh