require "pry"
def tickets(people)
  # Your solution here...
  tickets_hsh = Hash.new(0)
  p people
  
  people.each do |person|
    if person == 25
      tickets_hsh[25] += 1
    elsif person == 50
      tickets_hsh[25] -= 1
    elsif person == 100
      tickets_hsh[25] -= 3
    end
  end
  
  tickets_hsh[25] >= 0 ? "YES" : "NO"
end

#tickets([25, 25, 50])
puts tickets([25, 100])