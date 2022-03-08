class Being
end

class Living < Being
end

class Mammal < Living
end

class Human < Mammal
end

puts  Human.ancestors