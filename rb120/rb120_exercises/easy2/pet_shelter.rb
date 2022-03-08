require "pry"

class Pet
  attr_reader :pet_type, :pet_name
  @@all_pets = []

  def initialize(pet_type, pet_name)
    @pet_type = pet_type
    @pet_name = pet_name
    @@all_pets << [pet_type, pet_name]
  end

  def self.available_pets
    @@all_pets
  end

  def self.print_pets
    @@all_pets.each do |pet|
      puts "a #{pet.first} named #{pet.last}"
    end
  end
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def add_pet(pet)
    @pets << pet
  end

  def number_of_pets
    pets.size
  end

end

class Shelter
  attr_reader :adoptions

  def initialize
    @adoptions = {}
  end

  def adopt(owner, pet)
    if adoptions.has_key?(owner.name)
      adoptions[owner.name] << [pet.pet_type, pet.pet_name]
      owner.add_pet(pet)
      
    else
      adoptions[owner.name] = [[pet.pet_type, pet.pet_name]]
      owner.add_pet(pet)
    end
    Pet.available_pets.delete([pet.pet_type, pet.pet_name])
  end


  def print_adoptions
    
    adoptions.each do |owner, pets|
      puts "#{owner} has adopted the following pets:"

      pets.each do |pet|
        puts "a #{pet.first} named #{pet.last}"
      end
    end
  end
end


butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
asta         = Pet.new('dog', 'Asta')
laddie       = Pet.new('dog', 'Laddie')
fluffy       = Pet.new('cat', 'Fluffy')
kat          = Pet.new('cat', 'Kat')
ben          = Pet.new('cat', 'Ben')
chatterbox   = Pet.new('parakeet', 'Chatterbox')
bluebell     = Pet.new('parakeet', 'Bluebell')


phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
Pet.print_pets