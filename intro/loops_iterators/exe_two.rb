puts "Go ahead and type in something interesting"

sentence = ''

while sentence
  if sentence == "STOP"
    break
  else
    puts "Type something again"
    sentence = gets.chomp
  end
end