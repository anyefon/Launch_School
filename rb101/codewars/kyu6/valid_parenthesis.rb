=begin
Write a function that takes a string of parentheses, and determines if the order of the parentheses 
is valid. The function should return true if the string is valid, and false if it's invalid.

Examples
"()"              =>  true
")(()))"          =>  false
"("               =>  false
"(())((()())())"  =>  true
Constraints
0 <= input.length <= 100

Along with opening (() and closing ()) parenthesis, input may contain any valid ASCII characters. 
Furthermore, the input string may be empty and/or not contain any parentheses at all. Do not treat 
other forms of brackets as parentheses (e.g. [], {}, <>).
input:
-a string of characters
output:
-a boolean true or false
rules:
-input is constraint to 100 characters
-input may contain valid ASCII characters
-input string may be empty or not contain any parentheses at all
algorithm:
-create a variable switch and assign a value of 0
-for each char in string
  -if char is a parenthesis
    -if char is "(", increment the value of switch by 1
    -else if char is ")" decrement the value of switch by 1
-if switch is equal to zero return true else return false
=end

def valid_parentheses(string)
  #your code here
  switch = 0
  string.each_char do |char|
    if char.match(/["()"]/)
      if char == ")" && switch <= 0
        return false
      elsif char == ")" && switch > 0
        switch -= 1
      else
        switch += 1
      end   
    end
  end
  switch == 0 ? true : false
end

#*******Another solution******
# def valid_parentheses(string)
#   open = 0
#   string.chars.each do |c|
#     open += 1 if c == "("
#     open -= 1 if c == ")"
#     return false if open < 0
#   end
#   open == 0
# end