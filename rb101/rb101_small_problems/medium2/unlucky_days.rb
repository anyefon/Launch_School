require 'date'

def friday_13th(year)
  unlucky_count = 0
  thirteenth = Date.new(year, 1, 13)
  12.times do
    unlucky_count += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end
  unlucky_count
end

puts friday_13th(2015) == 3
puts friday_13th(1986) == 1
puts friday_13th(2019) == 2

# input
#  year
# output
#  number of months that have five fridays

# Algorithm
# create a hash five_fridays with months as keys and number of fridays as values
# create a date variable from the date class given the year
# create a loop to go over the different months of the year
#  break condition of loop will be if month is greater than 13
#  if date is a friday, increment the # of fridays in hash for given month
#  increment date by one day
# return the number of 5s in hash

# Further exploration (better than my solution)
def five_fridays(year)
  hsh = Hash.new(0)
  date = Date.new(year, 1, 1)

  loop do
   if date.friday?
    hsh[date.month] += 1
   end

   date = date.next_day
   break if date.month > 12
  end

  hsh.values.count(5)
end


# my solution further exploration
def five_fridays(year)
  date = Date.new(year, 1, 1)
  hsh = Hash.new(0)

  loop do # iterates over the months of the year
    month = date.month

    loop do # iterates over each day in a given month
      if date.friday?
        hsh[month] += 1
      end
      
      date = date.next_day
      break if date.month == month
    end

    break if date.month > 12
    date = date.next_month
  end

  hsh.values.count(5)
end