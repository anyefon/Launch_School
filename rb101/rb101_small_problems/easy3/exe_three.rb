print "Please write word or multiple words: "
sentence = gets.chomp
puts "The are #{sentence.delete(' ').size} characters in \"#{sentence}\"." 