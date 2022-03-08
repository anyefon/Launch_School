MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = 1440
HOURS_PER_DAY = 24

def after_midnight(time_str)
  hours, minutes = time_str.split(':').map(&:to_i)
  (hours % HOURS_PER_DAY) * MINUTES_PER_HOUR + minutes
end

def before_midnight(time_str)
  minutes = MINUTES_PER_DAY - after_midnight(time_str)
  minutes == MINUTES_PER_DAY ? 0 : minutes
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0