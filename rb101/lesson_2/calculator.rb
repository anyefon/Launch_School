
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

def clear_screen
  system('clear') || system('cls')
end
prompt messages 'language_choice', "en"
prompt messages 'language_choice', "cn"

calculator_lang = ''
loop do
  calculator_lang = Kernel.gets.chomp
  if valid_num?(calculator_lang)
    break
  else
    prompt "Choose 1 for English or 2 for Mandarin"
  end
end

language = lang_choice(calculator_lang)
clear_screen

prompt messages 'welcome', language

name = ''
loop do
  name = Kernel.gets.chomp

  break unless name.empty?()
  prompt messages 'valid_name', language
end

prompt messages('greeting', language) + name + "!"
loop do # main loop
  number1 = ''

  loop do
    prompt messages 'first_number', language
    number1 = Kernel.gets().chomp()

    if valid_float?(number1)
      break
    else
      prompt messages 'valid_number', language
    end
  end

  number2 = ''
  loop do
    prompt messages 'second_number', language
    number2 = Kernel.gets().chomp()

    if valid_float?(number2)
      break
    else
      prompt messages 'valid_number', language
    end
  end

  prompt messages 'operator_choice', language
  prompt messages 'operator_choice_addition', language
  prompt messages 'operator_choice_subtraction', language
  prompt messages 'operator_choice_multiplication', language
  prompt messages 'operator_choice_division', language

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt messages 'valid_operator', language
    end
  end

  prompt op_to_mes(operator, language) + messages('confirm_op', language)

  result = case operator
           when '1'
             number1.to_i + number2.to_i
           when '2'
             number1.to_i - number2.to_i
           when '3'
             number1.to_i * number2.to_i
           when '4'
             number1.to_f / number2.to_f
           end
  prompt messages('result', language) + result.to_s

  prompt messages 'continuation_prompt', language
  answer = Kernel.gets.chomp
  break unless answer.downcase.start_with?('y')
  clear_screen
end
clear_screen
prompt name + messages('thanks', language)
