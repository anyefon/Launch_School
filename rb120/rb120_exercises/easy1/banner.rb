=begin
Understand the problem
Explicit requirements
  -given an incomplete class to complete
  -can add methods or instance variables
  -added code should be private
Implicit requirements
  -calculate the length of message(helper method may be)
  -assume the input will always fit in window
  -horizontal line should be four spaces longer than the given message
    -start and end with '+' with '-' inbetween
    -the length of the horizontal line 
     '+''-'+ length of input * '-'+ '-''+' 
  -empty line should be four spaces longer than the input, starting/ending
   with '|' and two spaces
    -formula for empty line, '|'' '+ length of input * ' '+ ' ''|'
Examples/test cases provided
=end


class Banner
  def initialize(message, width=message.size)
    @message = message
    @width = width
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private
  attr_reader :message, :width


  def horizontal_rule
    "+-#{'-' * width}-+"
  end

  def empty_line
    "| #{' ' * width} |"
  end

  def break_up(message)
    cloned_message = message.clone
    sentences = []

    while cloned_message.size > width 
      sentences << cloned_message[0, width]
      cloned_message = cloned_message[width..-1]
    end
    sentences << cloned_message
    sentences
  end

  def message_line
    sentences = break_up(message)
    sentences.map do |sentence|
      "| #{sentence.center(width)} |"
    end.join("\n")
  end
end

banner = Banner.new('To boldly go where no one has gone before.', 50)
puts banner

# banner = Banner.new('')
# puts banner

=begin
input:
-a message 
-width of the banner

output:
-bannerized message
rules:
-if message is longer than width of banner, break message into parts until message is shorter
  than width
-if message is shorter than width of banner, print message 

algorithm:
-create a width instance variable and accessor methods in the iniitialize method
-message line instance method
  -create an array messages
  -if message is longer than width of banner
    -break string into width long of characters and append to array messages
     -clone message
     -initialize start_index to 0, if message > width
      -break message from [start_index,width - 1] and append to array
      -increment start_index by width
     -append message to array messages
     -return array of messages

=end