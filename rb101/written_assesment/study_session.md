```ruby
arr1 = ["a", "b", "c"]

arr2 = arr1.dup

arr2.map! do |char|
  char.upcase!
end

puts arr1 
puts arr2
```
Why does line `10` output uppercase "A". "B" and "C"?

We initialize the local variable `arr1` on line `1`to the array object `["a", "b", "c"]. Then on line `4` we initialize the local variable `arr2` to the return value of the Array#dup method invocation. 

Array#dup returns a shallow copy of the calling array in this case arr1. So although arr2 points to a new array, the objects contained in arr2 are the same objects as in arr1. 

On line 6 we invoke the Array#map! and pass in the do..end as an argument. The map method iterates through the arr2 and calls the block on each iteration passing each element of the arr2.. So on each iteration of the block we are invoking the mutating method String#upcase!. This method mutates the caller by converting the string object to its uppercase version. 

Since the objects contained in the array object referenced by arr2 are the same as in array referenced by arr1, the mutation to the string objects on line 7 affects object referenced by arr1 as well. 

So line 10 outputs the uppercase versions of the strings "a", "b" and "c" and this line returns nil.

```ruby
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

incremented = arr.map do |n| 
            n + 1
            end
p incremented

```

what does the following code output? why?

The code outputs the array object referenced by the local variable `incremented` which is `[2, 3, 4, 5, 6, 7, 8, 9, 10, 11]`.

The first line initializes the local variable `arr` and the array object `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]` is assigned to it. On the next line, the `map` method is invoked on the array object referenced by `arr`. The `map` method alongside the `do..end` form a block. The `map` iterates over the array object referenced by `arr` and for each iteration, an element is passed into `do..end` as an argument which is assigned to the parameter `n`. `n` which now references the current element is incremented by one. This new value is returned by the `do..end` block to the `map` method. The `map` places all the returned values transformed by the block in a new array and returns it. 
On that same line, a local variable `incremented` is initialized and the returned value of the `map` method invocation is assigned to it. It now references the new array in memory.

Lastly, the `p` method is invoked and the array referenced by `incremented` is passed as argument to it. The `p` method outputs the array to the console and returns the array

```ruby
words = %w(jump trip laugh run talk)

new_array = words.map do |word|
  word.start_with?("t")
end

p new_array
```
What does the following code output and why?

The code outputs an array object `[false, true, false, false, true]`.

On the first line, a local variable `words` is initialized and assigned to an array object containing strings.

On the next line, the `map` method is invoked on the array object referenced by `words`. The `map` method invocation together with the `do..end` form a block. The `map` method iterates over the array object referenced by `words` and for each iteration, `map` passes the current element into `do..end` as an argument which is assigned to the block parameter `word`. `word` now references the current iteration element. The method `start_with('t')` is invoked on the `word` string object which returns `true` if the string starts with `'t'` and `false` otherwise. The boolean is then returned by `do..end` to the `map` method. The `map` method eventually returns a new array object madeup of all the returned values of the `do..end` for each iteration. 

A local variable `new_array` is initialized and assigned the returned value of the `map` method.

Lastly, `p` method is invoked and passed as argument the array object referenced by the `new_array` local variable.`p` outputs the array object and returns it.

```ruby
[1, 2, 3].each do |num|
  puts num
end
```
The `do..end` block that comes after the method invocation is actually an argument passed into the method. The `do..end` block together with the method invocation `each` form an inner scope.

```ruby
def test(b)
  b.map{|letter| "I like the letter :#{letter}"}
end

a = ['a', 'b', 'c']
test(a)

```
What is `a` after the `test` method returns? Did the method modify the value of `a`? Suppose we called `map!` instead of `map` from within `test`. Would that have any affect on the value of `a`?

After the `test` method invocation with `a` as argument executes, `a` still references the array object `['a', 'b', 'c']`.

`a` is intialized on line XXX and assigned the array object `['a', 'b', 'c']`. Next the `test` method is invoked with `a` as argument. In the `test` method definition, the method parameter `b` references the same array object as `a` after method invocation. On the line that follows, the `map` method is invoked on the array object referenced by `b`. The `map` method invocation alongside the argument `{..}` form a block and hence an inner scope. The `map` method iterates over each element in array referenced by `b` and passes each element into the `{..}` as argument. Afterwards, the `map` method uses the return values of the `{..}` to transform the elements of the caller. These return values are placed in a new array object and this is the array object returned by `map`. In addition, the return value of the `map` method serves as the return value for the `test` method because the `map` method invocation statement is the last statement in the `test` method definition. Evidently, no operations were performed on `b` which mutated the array object it references hence `a` too remains unchanged.

If `map` were changed to `map!`, then the value of `a` would be modified. In this case, `map!` would not return a new array object of transformed elements, instead it will be modifying the caller `b`. And since `a` and `b` both reference the same array object, `a` will reflect the changes made to `b`. Array referenced by `a` transforms to `["I like the letter a", "I like the letter b", "I like the letter c"]`

How the `Array#sort` method works?
The `Array#sort` method makes use of  the `<=>` method by comparing elements of the array. The `spaceship` operator takes two arguments and returns one of the following values:
`0` if the two arguments are equal, `-1` if the first argument is less than the second argument,`1` if the first argument is greater than the second argument and `nil` if the objects cannot be compared. When the return value is `0`, the order of elements is unpredictable. `Array#sort` can also take an optional block argument when performing custom sorting. The block takes two parameters and an expression which specifies the criterion of the sort. 

`select` returns a new array based on the block's return value. If the return value evaluates to true, then the element is selected.

`map` returns a new array based on the block's return value. Each element is transformed based on the return value.

`each` iterates of an array passing each element into the block as argument. The return value of the block is simply ignored and `each` returns the original array it was invoked on.



