MINUTES_PER_DAY = 1440
MINUTES_PER_HOUR = 60

def time_of_day(minutes)
  effective_minutes = minutes.abs % MINUTES_PER_DAY
  hrs = effective_minutes / MINUTES_PER_HOUR
  mins = effective_minutes % MINUTES_PER_HOUR
  
  if minutes < 0
    mins_diff = 60 - mins
    hrs_diff = 23 - hrs 
    return format('%02d:%02d', hrs_diff, mins_diff)
  else
    return format('%02d:%02d', hrs, mins)
  end
end

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"