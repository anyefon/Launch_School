
def prompt(message)
  puts "=> " + message
end

def calculate_area(length, width)
  format("%0.2f", length * width)
end

def sq_meter_to_sq_feet(num)
  format("%0.2f",  (num.to_f * 10.7639))
end

prompt "Enter the length of the room in meters: "
length = gets.chomp.to_f
prompt "Enter the width of the room in meters: "
width = gets.chomp.to_f
area_in_sq_meters = calculate_area(length, width)
area_in_sq_feet = sq_meter_to_sq_feet(area_in_sq_meters)
prompt "The area of the room is #{area_in_sq_meters} square meters (#{area_in_sq_feet} square feet)."
