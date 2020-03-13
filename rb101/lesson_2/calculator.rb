
require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def messages(message, lang='en')
  MESSAGES[lang][message]
end

def prompt(key)
  Kernel.puts "=> #{key}"
end

def valid_num?(number)
  /^[1-2]+$/.match(number)
end

def valid_float?(num)
  /\d/.match(num) && /^\d*\.?\d*$/.match(num)
end

def op_to_mes(op, lang)
  op_message = { "en" => ['Adding', 'Subtracting', 'Multiplying', 'Dividing'],
                 "cn" => ['正在相加', '正在相减', '正在相乘', '正在相除'] }
  op_message[lang][(op.to_i) - 1]
end

def lang_choice(lang_number)
  if lang_number == '1'
    'en'
  else
    'cn'
  end
end

def choose_lang
  prompt messages 'language_choice', "en"
  prompt messages 'language_choice', "cn"
  calculator_lang = ''
  loop do
    calculator_lang = Kernel.gets.chomp
    break unless !(valid_num?(calculator_lang))
    prompt "Choose 1 for English or 2 for Mandarin"
  end
  lang_choice(calculator_lang)
end

def obtain_name
  name = ''
  loop do
    name = Kernel.gets.chomp
    break unless name.empty?()
    prompt messages 'valid_name', language
  end
  name
end

def obtain_number(numb_str, lang)
  number = ''
  loop do
    prompt messages numb_str, lang
    number = Kernel.gets().chomp()
    break unless !(valid_float?(number))
    prompt messages 'valid_number', lang
  end
  number
end

def choose_operation(lang)
  opr = ''
  loop do
    opr = Kernel.gets().chomp()

    break unless !(%w(1 2 3 4).include?(opr))
    prompt messages 'valid_operator', lang
  end
  opr
end

def calculation(opr, number1, number2)
  case opr
  when '1'
    number1.to_i + number2.to_i
  when '2'
    number1.to_i - number2.to_i
  when '3'
    number1.to_i * number2.to_i
  when '4'
    number1.to_f / number2.to_f
  end
end

def clear_screen
  system('clear') || system('cls')
end

language = choose_lang
clear_screen

prompt messages 'welcome', language
user_name = obtain_name

prompt messages('greeting', language) + user_name + "!"
loop do # main loop
  first_number = obtain_number('first_number', language)
  second_number = obtain_number('second_number', language)

  prompt messages 'operator_choice', language
  prompt messages 'operator_choice_addition', language
  prompt messages 'operator_choice_subtraction', language
  prompt messages 'operator_choice_multiplication', language
  prompt messages 'operator_choice_division', language

  operator = choose_operation(language)

  prompt op_to_mes(operator, language) + messages('confirm_op', language)

  result = calculation(operator, first_number, second_number)
  prompt messages('result', language) + result.to_s

  prompt messages 'continuation_prompt', language
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?('y')
  clear_screen
end
clear_screen
prompt user_name + messages('thanks', language)
