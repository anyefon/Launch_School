vehicles = [
  'Car', 'car', 'truck', 'car', 'SUV', 'Truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]


# def count_occurrences(vehicles)
#   car_hsh = {}
#   vehicles.each do |vehicle|
#     if car_hsh.key?(vehicle)
#       car_hsh[vehicle] += 1
#     else
#       car_hsh[vehicle] = 1
#     end
#   end
#   car_hsh.each {|key, value| puts "#{key} => #{value}" }
# end
# count_occurrences(vehicles)

# Further exploration

def count_occurrences(vehicles)
  car_hsh = {}
  vehicles.each do |vehicle|
    vehicle.downcase!
    if car_hsh.key?(vehicle)
      car_hsh[vehicle] += 1
    else
      car_hsh[vehicle] = 1
    end
  end
  car_hsh.each {|key, value| puts "#{key} => #{value}" }
end

count_occurrences(vehicles)