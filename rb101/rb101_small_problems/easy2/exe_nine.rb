name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# BOB
# BOB
# The name string variable references the 'Bob' string object. After the save_name = name assignment 
# statement, save_name and name both reference the same string object in memory. Calling the upcase!
# method on name modifies it in place. And since save_name and name both reference the same memory
# slot, the print out is the same. Calling object_id on both save_name and name should proof this.

puts name.object_id # 47254744215160
puts save_name.object_id # 47254744215160