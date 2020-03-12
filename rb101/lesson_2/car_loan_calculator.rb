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

def yrs_to_months(duration_in_yrs)
  duration_in_yrs.to_i * 12
end

def interest_converter(rate)
  rate.to_f / 1200
end

def result(amt)
  format('$%.2f', amt)
end

def obtain_loan
  prompt " What is the loan amount? (in dollars)"

  loan_amt = nil
  loop do
    loan_amt = gets.chomp

    break if valid_num?(loan_amt)
    prompt "Enter a valid positive loan amount"
  end
  loan_amt
end

def obtain_int_rate
  prompt "Enter the interest rate in % (for example 7 for 7%)"
  interest_rate = nil
  loop do
    interest_rate = gets.chomp
    break if valid_num?(interest_rate)
    prompt "Make sure to enter a valid non-negative interest rate"
  end
  interest_rate
end

def obtain_loan_duration
  prompt "Enter the loan duration in years"
  loan_dur = nil
  loop do
    loan_dur = gets.chomp
    break if validate_year?(loan_dur)
    prompt "Make sure to enter a valid non-negative loan duration"
  end
  loan_dur
end

def calculate_monthly_payment(amount, rate, duration)
  dur_in_mths = yrs_to_months(duration)

  monthly_rate = interest_converter(rate)
  amount.to_f * (monthly_rate / (1 - (1 + monthly_rate)**(-dur_in_mths)))
end

clear_screen
prompt "Welcome to the best Car loan Calculator!\n\n"
loop do
  loan_amount = obtain_loan

  int_rate = obtain_int_rate

  loan_dur = obtain_loan_duration

  monthly_payment = calculate_monthly_payment(loan_amount, int_rate, loan_dur)

  prompt "Amount $#{loan_amount}, rate #{int_rate}%, duration #{loan_dur} years"
  prompt " Your monthly payment is :#{result(monthly_payment)}"

  prompt "Another calculation? Enter Y to continue or any other key to exit"
  answer = gets.chomp

  break unless answer.downcase().start_with?('y')
  clear_screen
end
clear_screen

prompt "Thank for using car loan calculator and have a nice day!"
