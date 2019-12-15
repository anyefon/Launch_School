family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

siblings = family.select do |key, value|
  key == :brothers || key == :sisters
end

arr = siblings.values.flatten
p arr 