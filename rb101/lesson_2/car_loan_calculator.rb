def prompt(text)
  puts "=> #{text}"
end

def clear_screen
  system('clear') || system('cls')
end

def valid_num?(num)
  /\d/.match(num) && num.to_f >= 0
end

def validate_year?(yr)
  /\d/.match(yr) && yr.to_i >= 0
end

def loan_converter(duration_in_yrs)
  duration_in_yrs.to_i * 12
end

def interest_converter(int_rate)
  int_rate.to_f / 1200
end

def payment_calc(p, j, n)
  p.to_f * (j / (1 - (1 + j)**(-n)))
end

def result(amt)
  format('$%.2f', amt)
end

clear_screen
prompt "Welcome to the best Car loan Calculator!\n\n"
loop do
  prompt "What is the loan amount? (in dollars)"

  loan_amt = nil
  loop do
    loan_amt = gets.chomp

    if valid_num?(loan_amt)
      break
    else
      prompt("Enter a valid positive loan amount")
    end
  end

  prompt("Enter the interest rate in % (for example 7 for 7%)")

  interest_rate = nil
  loop do
    interest_rate = gets.chomp
    if valid_num?(interest_rate)
      break
    else
      prompt("Make sure to enter a valid non-negative interest rate")
    end
  end

  prompt("Enter the loan duration in years")

  loan_duration = nil
  loop do
    loan_duration = gets.chomp
    if validate_year?(loan_duration)
      break
    else
      prompt("Make sure to enter a valid non-negative loan duration")
    end
  end

  #  conversion of load duration in yrs to loan duration in months
  month_dur = loan_converter(loan_duration)

  monthly_interest_rate = interest_converter(interest_rate)

  monthly_payment = payment_calc(loan_amt, monthly_interest_rate, month_dur)

  prompt(" Your monthly payment is :#{result(monthly_payment)}")

  prompt("Another calculation?")
  answer = gets.chomp

  break unless answer.downcase().start_with?('y')
end
clear_screen

prompt("Thank for using car loan calculator and have a nice day!")
