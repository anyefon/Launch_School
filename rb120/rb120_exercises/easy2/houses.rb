# class House
#   attr_reader :price

#   def initialize(price)
#     @price = price
#   end

#   def compare(other_obj)
#     if self.price < other_obj.price
#       puts "Home 1 is cheaper"
#     elsif self.price > other_obj.price
#       puts "Home 2 is more expensive"
#     end
#   end
# end

# home1 = House.new(100_000)
# home2 = House.new(150_000)
# home1.compare(home2)
# home2.compare(home1)

class House
  attr_reader :price
  include Comparable

  def initialize(price)
    @price = price
  end

  def <=>(other)
    price <=> other.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1