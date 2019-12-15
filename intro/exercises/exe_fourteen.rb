#use each to loop over the contacts hash
#for each contact value key, assign the first entry of the contact-data array then delete it
=begin
#my original take
contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}
contacts["Joe Smith"][:email] = ""
contacts["Joe Smith"][:address] = ""
contacts["Joe Smith"][:phone] = ""

contacts.each do |key, value|
  value.each do |k, v|
    v = contact_data.shift
    puts v
  end
end
p contacts
=end
=begin
contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}
hash_keys = [:email, :address, :phone]

contacts.each do |key, value|
  hash_keys.each do |k|
    value[k] = contact_data.shift
  end
end
p contacts
=end
#my solution. see textbook for different implementation
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
hash_keys = [:email, :address, :phone]

contacts.each do |key, value|
  arr = contact_data.shift 
  p arr
  hash_keys.each do |k|
    value[k] = arr.shift
  end
  
end
p contacts

