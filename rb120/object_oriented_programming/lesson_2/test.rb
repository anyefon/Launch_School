class FarmAnimal
  attr_accessor :name

  def initialize
    @name = 'pig farm'
  end

  def speak
    "#{self.class} says "
  end

  private
  name
end

class Sheep < FarmAnimal
  def speak
    super + "baa!"
  end
end

# class Lamb < Sheep
#   def speak
#     super + "baaaaaaa!"
#   end
# end

# class Cow < FarmAnimal
#   def speak
#     super + "mooooooo!"
#   end
# end

p Sheep.new # => "Sheep says baa!"
# puts Lamb.new.speak # => "Lamb says baa!baaaaaaa!"
# puts Cow.new.speak # => "Cow says mooooooo!"