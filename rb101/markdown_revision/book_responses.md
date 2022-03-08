1. what is local variable scope? How do local variables interact with method invocations with blocks and method definitions?

variable scope is the part of the program the variable is available for use. This is scope is determined by where the local variable is initialized. In ruby, a variable scope is defined by a block. A block is a method invocation followed by a `do..end` or `{ }`.

```ruby
a = 3

loop do # method invocation with a block
	a += 1
	b = 1 # b is intialized in the inner scope

	break if a > 7
end

puts a
puts b
```
`line 15` `puts` method outputs `8` and returns `nil`. According to local variable scoping rules, local variable `a` is visible in the inner scope created by `loop do..end`, hence it is incremented still its value is 8.

`puts b` issues an error because b was initialized in the inner scope and is not available to the outer scope according to local variable scoping rules.

**Local variables interaction with method invocations with blocks**

* Outer scope local variables can be accessed by the inner scope

* Inner scope local variables cannot be accessed in the outer scope

* Peer scopes do not conflict

* nested blocks follow the same rules as inner and outer scopes

* variable shadowing- when blocks take a parameter of the same name as a local variable initialized in the outer scope.

**Local variables interaction with method definitions**

* A method definition cannot access local variables in another scope

* A method definition can access objects passed in as arguments

2. Give two examples each of how passing an object into a method definition can or cannot permanently change the object.

```ruby
# mutating method

def a_method(value)
	puts value
	value << "789"
end

value = "123"
puts value.object_id
returned_value = a_method(value)
puts returned_value.object_id
```

```ruby
# non_mutating

def a_method(value)
	value.upcase
end

value = "hello"
puts value.object_id
returned_value = a_method(value)
puts returned_value.object_id
```

3. How are arrays, strings and hashes different from each other. Explain how collection methods (each, map, select) work.

**Similarities**

* They are all data structures.

**Differences**

* Arrays and strings are ordered according to an index which goes from `0..length - 1` of the data structure. While hashes just started retaining order recently.
* Hashes store data in `key-value` pairs. While arrays and strings order data using an index.
* Arrays and hashes can contain any data type from the ruby language while strings can only have a sequence of characters.

`each` method

`each` method returns the original array without any changes to it. It ignores the block's return value and just iterates through the caller passing into the block one elt at a time.

`select` method

`select` returns a new array based on the return value of the block. If the block's return value evaluates to true/ truthy, then the element is selected.

`map` method

`map` returns a new array based of the return value of the block. Each element is transformed based on the return value

4. How do variables work as pointers?

Variables are labels we create to refer memory blocks in the computer. When we initialize a local variable and assign it an object, this variable then reference/point to the memory address where the object is located.

If we call a mutating method on the given object, the object is modified in place without changing the memory address.

```ruby
a = 'hello'
puts a.object_id
a << " world"
a # => 'hello world'
puts a.object_id
```
If we call a non-mutating method on the given object, a new object is returned and stored in a new memory location. The original object is left intact. Or if the local variable is reassigned to another object.

5. `puts` vs `return`. Explain.

`puts` is a method from the `Kernel` module that outputs its argument passed in to the screen/standard output and returns `nil`. 

The `return` keyword is used in a method definition to explicitly return a value. Once execution reaches this keyword, execution passes to the outer scope and the returned value serves as the return value of the method invocation.

6. What is `false`? what is `nil`? Define truthiness.


