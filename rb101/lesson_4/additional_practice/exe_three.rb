ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# ages.select! {|_, value| value < 100 }

p ages.reject! { |_, value| value >= 100 }
# delete_if, keep_if can also be used in this exercise
p ages