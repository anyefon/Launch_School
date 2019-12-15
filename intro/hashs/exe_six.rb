#iterate through the words array
#for each word, split it rearrange the letters alphabetically and join them
#considering this word as a key, if result contains the key, append the word in the array
#else create a new key-pair 

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
anagrams = {}

words.each do |word|
  key = word.split("").sort.join
  if anagrams.has_key?(key)
    anagrams[key].push(word)
  else
    anagrams[key] = [word]
  end
end
 
anagrams.each_value do |value|
  p value
end