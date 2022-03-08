module Walkable
  def walk
    puts "#{full_name} #{gait} forward"
  end

  def full_name
    "#{title} #{name}".strip
  end
end

class Noble
  include Walkable
  attr_reader :name, :title

  def initialize(name, title)
    @name = name
    @title = title
  end

  private

  def gait
    "struts"
  end
end

class Person
  include Walkable
  attr_reader :name, :title

  def initialize(name)
    @name = name
  end
  
  private

  def gait
    "strolls"
  end
end

class Cat
  include Walkable
  attr_reader :name, :title

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  include Walkable
  attr_reader :name, :title

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"

byron = Noble.new("Byron", "Lord")
byron.walk