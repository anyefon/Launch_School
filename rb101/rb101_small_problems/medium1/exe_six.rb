def minilang(string)
  string_arr = string.split
  stack = []
  register = 0

  string_arr.each do |item|
  
    case item
    when 'PUSH'
      stack << register
    when 'ADD'
      register = stack.pop + register
    when 'SUB'
      register = register - stack.pop
    when 'MULT'
      register = register * stack.pop
    when 'DIV'
      register = register / stack.pop
    when 'MOD'
      register = register % stack.pop
    when 'POP'
      register = stack.pop
    when 'PRINT'
      puts register
    else
      register = item.to_i
    end
  end
end

minilang('6 PUSH')