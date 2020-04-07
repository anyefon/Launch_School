prompts = ["What is your age? ", "At what age would you like to retire? "]
answers = prompts.map do |prompt|
  print prompt
  answer = gets.chomp.to_i
end
current_year = Time.now.year

puts "It's #{current_year}. You will retire in #{current_year + (answers[1]-answers[0])}"
puts "You have only #{answers[1]-answers[0]} years of work to go!"