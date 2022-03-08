# class Dog
#   def speak
#     'bark!'
#   end

#   def swim
#     'swimming!'
#   end
# end


# teddy = Dog.new
# puts teddy.speak
# puts teddy.swim

# karl = Bulldog.new
# puts karl.speak
# puts karl.swim

# exercise two
# solution
=begin
-create a pets class 
-move all shared methods to the pets class
-Dog class should have only the 'swim' and 'fetch' methods
-make the Dog and Cat classes inherit from the pets class
=end

class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end

end

class Cat < Pet
  def speak
    'meow!'
  end
end

class Dog < Pet
  def speak
    'bark!'
  end

  def swim
    'swimming'
  end

  def fetch
    'fetching!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

pete = Pet.new
kitty = Cat.new
dave = Dog.new
bud = Bulldog.new

# puts pete.run
# puts pete.speak

# puts kitty.run
# puts kitty.speak
# puts kitty.fetch

# puts dave.speak

# puts bud.run
# puts bud.swim

p Bulldog.ancestors