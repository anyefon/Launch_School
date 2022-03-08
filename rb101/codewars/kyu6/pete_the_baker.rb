=begin
Pete likes to bake some cakes. He has some recipes and ingredients. Unfortunately he is not 
good in maths. Can you help him to find out, how many cakes he could bake considering his recipes?

Write a function cakes(), which takes the recipe (object) and the available ingredients 
(also an object) and returns the maximum number of cakes Pete can bake (integer). 
For simplicity there are no units for the amounts (e.g. 1 lb of flour or 200 g of sugar 
are simply 1 or 200). Ingredients that are not present in the objects, can be considered as 0.

Examples:

// must return 2
cakes({flour: 500, sugar: 200, eggs: 1}, {flour: 1200, sugar: 1200, eggs: 5, milk: 200}); 
// must return 0
cakes({apples: 3, flour: 300, sugar: 150, milk: 100, oil: 100}, {sugar: 500, flour: 2000, milk: 2000});
input:
-two hashes, one recipe the other ingredients
output:
-the maximum number of cakes Pete can bake
rules:
-if number of items in recipe is more than the number of items in ingredients, return 0
-if number of items in recipe is less than the number of items in ingredients, divide
  each entry in ingredients by its equivalent in recipes

algorithm:
-create a quotients array
-for each key, value pair in recipe, 
  -divide the equivalent value pair in ingredients by the recipe value and append to quotients array
-return the minimum number 
=end

def cakes(recipe, available)
  #your code here
  quotients = []

  recipe.each do |key1, value1|
    value2 =  available[key1]
    value2 = 0 if value2 == nil

    quotients << value2/ value1
  end
  quotients.min
end