def century_number(year)
  year % 100 == 0 ? year / 100 : (year / 100) + 1
end

def century(year)
  num = century_number(year)
  case num % 100
  when 11, 12, 13
    num.to_s + 'th'
  else
    case num % 10
    when  1
      num.to_s + 'st'
    when  2
      num.to_s + 'nd'
    when  3
      num.to_s + 'rd'
    else
      num.to_s + 'th'
    end
  end
end


puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'
