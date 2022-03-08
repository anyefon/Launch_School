=begin
Sherlock has to find suspects on his latest case. He will use your method, dear Watson.
 Suspect in this case is a person which has something not allowed in his/her pockets.

Allowed items are defined by array of numbers.

Pockets contents are defined by map entries where key is a person and value is one or few things 
represented by an array of numbers (can be nil or empty array if empty), example:

pockets = { 
  bob: [1],
  tom: [2, 5],
  jane: [7]
} 
Write method which helps Sherlock to find suspects. If no suspect is found or there are no pockets (pockets == nil), 
the method should return nil.

find_suspects(pockets, [1, 2]) # => [:tom, :jane]
find_suspects(pockets, [1, 7, 5, 2]) # => nil
find_suspects(pockets, []) # => [:bob, :tom, :jane]
find_suspects(pockets, [7]) # => [:bob, :tom]

input:
-a hash, an array
output:
-an array of suspects
definitions:
-input array defines allowed items, items the people have permission to have in thier hash arrays
-a suspect is someone who has an item outside of the input array, that is has something without permission

algorithm
-assign input array to permissions variable
-create a suspects array
-if pockets is empty, return nil
-for each item in pockets (key, value)
  -for each item in value,check if item is in the permissions array
    -if so, okay
  -if not
    -append key to the suspects list
-return the suspects list 
=end

# return array of suspects with illegal items in their pockets
pockets = { 
  bob: [1],
  tom: [2, 5],
  jane: [7]
} 

def find_suspects(pockets, allowed_items)
  suspects = []

  pockets.each do |key, value|
    next if value == nil

    value.each do |item|
      next if item == nil
      
      if allowed_items.include?(item)
        item
      else
        suspects << key if !(suspects.include?(key))
      end
    end
  end
  suspects.empty? ? nil : suspects
end

p find_suspects(pockets, [1, 2])