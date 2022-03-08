Example 1

What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
a = ‘Hello’
b = a
a = 'Goodbye'
```
This code when run returns the string referenced by `a` whose value is `"Goodbye"`. In the first line the string whose value is `'Hello'` is assigned to the variable `a`, the second line makes `b` reference the same string as `a`, and the last line of code reassigns the variable `a` to the new string `"Goodbye"`. Eventhough `a` references a new string object now, `b` still points to the `'Hello'`string object in memory. This demonstrate that the assignment operation is not destructive.

Example 2

What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
a = 4

loop do
  a = 5
  b = 3
  break
end

puts a
puts b
```
This snippet of code when run outputs the value referenced by the variable `a` which is `5` and in addition issues a `NameError` exception for the `b` variable to the console.

 `a` is initialized in the outer scope and the integer object `4` assigned to it, and then reassigned to `5` in the inner scope formed by the  `loop` method innvocation and `do..end`. Finally, the `puts` method is invoked with `a` as argument. Since `a` was reassigned, the new value `a` now references is output.`b` on the other hand is initialized in the inner scope formed by the `loop` method invocation and `do..end` argument. And on the last line `puts` method is invoked with `b` as argument. Since `b` is not defined in the outer scope, it cannot be accessed hence the `NameError` exception. This highlights the local variable scoping rule which says a local variable defined in the outer scope can be accessed in the inner scope but a variable defined in the inner scope cannot be accessed from the outside

Example 3

What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
a = 4
b = 2

loop do
  c = 3
  a = c
  break
end

puts a
puts b
```
The code outputs to the console the values `3` and `2` respectively on separate lines. Variables `a` and `b` are intialized in the outer scope and assigned the values `4` and `2`. Then in the inner scope formed by the `loop` method invocation and the `do..end`argument, variable `c` is initialized and assigned the value `3`, `c`'s reference to `3` is shared with the variable `a` so they both reference the same value.
When `puts` is invoked with `a` as argument, `3` is output because `a` was reassigned in the inner scope and `b` is unchanged. This demonstrates a local variable scoping rule where a variable initialized in the outer scope can be accessed in the inner scope.

Example 4

What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
def example(str)
  i = 3
  
  loop do 
    puts str
    i -= 1
    break if i == 0
  end
end

puts example('hello')
```
The `example('hello')` method invocation as argument to the `puts` method returns `nil` to the `puts` method.
When `puts example('hello')`is executed, the string `'hello'`is printed thrice successively to the console on separate lines and then followed by a blanck line.

In the absence of an explicit `return` statement in a function, the last line evaluated serves as the return value of the function. In this case the `break` statement is the last statement to execute and because it has no arguments, it returned `nil` to the `puts` method call which was printed as a blanck line.

The `loop`method call with the `do..end` argument form a block which prints `str` three times as the `counter` variable is decremented at each iteration still the `break` condition is met.

This code demonstrates the implicit `return` of a method in the absence of an explicit `return` statement and the value returned to the outer scope.


Example 5

What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
def greetings(str)
  puts str
  puts "Goodbye"
end

word = "Hello"

greetings(word)
```
The method invocation `greetings(word)` returns `nil` .
The strings `'Hello'` and `'Goodbye'` are printed to the console respectively on separate lines.

The method returns `nil` because in the absence of an explicit `return` statement, the return value of the last evaluated statement in the function serves as the return value of the whole function. In this case `puts "Goodbye"` is the last line evaluated in the `greetings` method which prints `"Goodbye"` to the console and returns `nil` which serves as the return value of the whole method.

The `word` variable is assigned the string object with value `"Hello"` and the `greetings` method has a parameter `str`. So when `word` is passed as argument in the method call `greetings(word)`, both `str` and `word` reference the same string object `"Hello"` hence the output.

This code brings to light the concepts of object passing and variables as pointers. After the method call `greetings(word)`, both `str` and `word` referenced the same object and eventhough `word` was not initialized within the scope of the method, any changes made to `str` will reflect on `word`

Example 6

What does the following code return? What does it output? Why? What concept does it demonstrate?

```ruby
arr = [1, 2, 3, 4]

counter = 0
sum = 0

loop do
  sum += arr[counter]
  counter += 1
  break if counter == arr.size
end 

puts "Your total is #{sum}"
```
The code outputs the string `"Your total is 10"` to the console.
In the block formed by the `loop` method invocation and the `do..end` argument, the elements of the `arr` array are successively being added to the  `sum` variable at each iteration of the loop until `counter` is equal to the `arr.size` and the loop `break`s passive execution to the outer scope. The `puts` method with the string argument is executed and we get the above output.

This code demonstrates local variable scoping rules 
where local variables initialized in an outer scope can be accessed in an inner scope(the block formed from `loop` and `do..end`) and modified.

Example 7

What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
a = 'Bob'

5.times do |x|
  a = 'Bill'
end

p a
```
The code returns the string `'Bill'` and outputs `'Bill'` to the console. To start out `a` is initialized and the string object `'Bob'` is assigned to it. In the inner scope/block formed by the `times` method call with `do..end` as argument, the `a` variable is reassigned to `'Bill'` string object five times. After which `p` method in the `kernel` is invoked and `a` passed as argument which prints to the console `'Bill'` string object and returns `'Bill'`
This example demonstrates local variable scoping rules specifically in this case local variables initialized in the outer scope can be accessed in the inner scope.


Example 8

What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
animal = "dog"

loop do |_|
  animal = "cat"
  var = "ball"
  break
end

puts animal
puts var
```
The following code returns `nil`  and a `NameError` exception and outputs the string `"dog"` to the console.
The `animal` variable is initialized and assigned to the `'dog'` string object. In the block/ inner scope formed by the `loop` method invocation and `do..end` argument, `animal` is reassigned to `'cat'`.Upon exit from the `loop`, `animal` still references the `'cat'` object and that is what is printed to the console when `puts` is invoked with  `animal` as argument. 

The `NameError`exception is issued for the `puts var` method call because the code is trying to access the object referenced by `var` however `var` is not visible in the  outerscope. `var`  was initialized in the block formed by the `loop` method call and `do..end` argument and hence cannot be accessed outside of this scope. 

This demonstrates local variable scoping rules where local variables initialized in an outer scope can be accessed in the inner scope (`loop` + `do..end` in this case) while local variables initialized in the inner scope cannot be accessed in the outer scope.

Variable Shadowing

Example 1

What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
a = 4
b = 2

2.times do |a|
  a = 5
  puts a
end

puts a
puts b
```
The code returns `nil` twice and outputs `4` and `2` respectively to the console. 

`nil` is returned twice because of the `puts` method invocation which takes place at the end of the code.`puts` prints its argument to the output and returns `nil`. 
At the start of the code `a` and `b` are both initialized to `4` and `2` respectively. In the block formed by the `times` method invocation followed by the `do..end` argument, a different variable `a` is initialized and the value of `5` assigned to it. Since this variable share the same name as the variable `a` intialized in the outer scope, `a` in the outer scope cannot be accessed in the inner scope hence any changes made to the `a` in the inner scope are not reflected in `a` in the outer scope. That's why `a` still points to `4`.
The concept demonstrated here is variable shadowing whereby a local variable in the outer scope cannot be accessed in an inner scope due to the fact that there exist another local variable in the inner scope that shares the same variable name as the local variable in the outer scope.

Example 2

What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
n = 10

1.times do |n|
  n = 11
end

puts n
```
The following code when run returns `nil` and outputs `10` to the console. At the start, the local variable `n` is initialized and assigned an Integer object of  value `10`. In the block formed by the `times` method invocation and the `do..end` argument, another local variable which shares the same name as `n` in the outer scope is initialized too. This prevents `n` in the outer scope to be visible in the inner scope and any changes made to the `n` in the inner scope are not reflected in `n` in the outer scope hence `puts n` prints `10` to the output. This code demonstrates the concept called variable shadowing where by a local variable initialized in the outer scope cannot by accessed in the inner scope because there exist another local variable in the inner scope that share the same variable name as the local variable in the outer scope.

Example 3

What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
animal = "dog"

loop do |animal|
  animal = "cat"
  break
end

puts animal
```
The following code returns  `nil` and outputs `"dog"` to the console. At the start local variable `animal` is initialized and assigned the string object with value `"dog"`. In the block formed by the `loop` method invocation and the `do..end` argument, a different locale variable that shares the same name as `animal` in the outer scope is initialized and further assigned the string object `"cat"`. Because of this, `animal` in the outer scope cannot be accessed in the inner scope hence all changes made to `animal` in the inner scope are not reflected in `animal` in the outer scope.
This demonstrates the concept of variable shadowing where by a local variable in an outer scope cannot be accessed in an inner scope because there exist another local variable in the inner scope which shares the same variable name with it. Hence any changes made to the local variable in the inner scope are not reflected in the local variable in the outer scope.

Object Passing/Variables As Pointers

Example 1

What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
a = "hi there"
b = a
a = "not here"
What are a and b?
```
`a` references the string object `"not here"` and `b` references the string object``"hi there"`. At the start `a` points to the `"hi there"` string object. Later run `b=a` makes `b` and `a` both point to this string object in memory. The last assignment statement `a = "not here"` gives `a` a new reference while `b` continues to reference the first string. The reference of `a` to `"hi there"` has been broken and a new reference to `"not here"` has been established.

This demonstrates the concept of variables as pointers. When a local variable is assigned an object, the local variable stores a reference to that object in memory and that object can be accessed through that reference. Multiple local variables can have the same reference to a particular object in memory. When a local variable is reassigned to a new object, the link with the previous object is broken and a new one is established. The old object remains unchanged however and can still be accessed if it has other local variables which reference it.

Example 2

What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
a = "hi there"
b = a
a << ", Bob"
What are a and b?
```
Both `a` and `b` reference the string object `"hi there, Bob"`. First line `a` is initialized and assigned the string object `"hi there"`, second line `b` and `a` share the same reference to the string `"hi there"`. Third line, `", Bob"` is concatenated to the string referenced by `a` which now becomes `"hi there, Bob"`. And since `b` also references the same string in memory, these changes affect it also. 

This concept brings to light the concepts of variables as pointers and mutating methods. Because `a` and `b` share the same reference to a string object, the string object can be modified using either local variable and the results will be reflected by the other.

Example 3 

What does the following code return? What does it output? Why? What concept does it demonstrate?
```ruby
a = [1, 2, 3, 3]
b = a
c = a.uniq
```
What are a, b, and c? What if the last line was `c = a.uniq!`?

First line `a` is initialized and assigned to Array object `[1,2,3,3]` so `a` now references array in memory. Second line this reference is shared with `b` so both local variables `a` and `b` both point to the same array object in memory. Third line, method `uniq` is invoked on the array referenced by `a`. The result is a new array which is assigned to local variable `c`.Thus `c` references this new array.
`c = a.uniq!` 




