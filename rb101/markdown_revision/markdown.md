1. What is local variable scope? How do local variables interact with method invocations with blocks and method definitions?

Local variable scope is the area of a program where a local variable is visible.

A method definition defines the scope of local variables. This scope is stand-alone from the scope of the main program. So local variables from the outer scope can only be accessed from inside a method definition if passed in as arguments during method invocation.

A method invocation with a `do..end` forms a block. According to local variable scope rules, local variables from the outer scope can be accessed within a `do..end` but local variables intialized within the `do..end` cannot be accessed outside. So be invoking a method while passing a `do..end` as argument, a method can indirectly access local variables outside its scope.

2. Give two examples each of how passing an object into a method definition can or cannot permanently change the object.

```ruby
def a_method(array)
	array.pop
	# mutates the caller permanently
end

arr = [1, 2, 3, 4]
a_method(arr)
p arr
```

```ruby
def a_method(array)
	array.first
	# does not mutate the caller permanently
end

```
write methods for integers and strings.

3. How are arrays, strings and hashes different from each other. Give similarities and differences. Explain how collection methods each, map and select work.


* Arrays and strings are ordered and individual elements can be accessed using indices which range from `0..length - 1` of the data structure. Hashes only recently started preserving order of their key-value pairs.

* Arrays and hashes can contain just about all the object types as elements. Strings on the other hand contain only character sequences.

* Hashes have key-value pairs and values are referenced like this `hash[key]` while elements of arrays and strings are referenced using indices.

4. How do variables work as pointers?

Variables can be thought of as labels for blocks of memory. When a local variable is initialized and assigned a value, it points to or references that object in memory. So, in order to perform operations on that object, we will need the local variable to reference it.

5. `puts` vs `return` . Explain.

`puts` is a method in the `Kernel` module that outputs the argument passed it when invoked to `stdout` while returning `nil`.

`return` on the other hand is a keyword mostly used in method definitions. During runtime, when execution reaches the `return` keyword, execution passes from the method invocation to the outer scope while returning the value of the expression that comes after the `return` keyword. This value can be captured by a local variable as the return value of the method invocation.

6. what is `false`? what is `nil`? Define truthiness.

`false` is a boolean object.

`nil` is an object of the `NilClass`

Truthiness is a concept in programming whereby values in a conditional evaluate to `true` or `false` eventhought the values are not booleans. In ruby for example, all objects except `false` and `nil` evaluate to true.

7. what is a method definition and method invocation? Give examples?

A method definition can be thought of as creating a scope for local variables. This scope stands out of the normal execution flow of the program. Local variables in the inner scope cannot be accessible to the outer scope and local variables in the outer scope can't access this inner scope unless passed in as arguments during method invocation

A method invocation can be thought of as using this scope. If a `do..end` accompanies a method invocation, then we have a block. And even though local variables can't access the scope of a method definition directly, they are visible inside a `do..end` and hence can be used in a method invocation.

```ruby
# method definition
def a_method
	yield
	puts "This is a method definition"
end

# method invocation
a_method do
	puts "This is a method invocation with a block"
end
```

8. What is an implicit return value? Give examples of implicit return values of method invocations and blocks?

In ruby, every method call returns a value after execution. If a method definition has a specified `return` keyword, then the method invocation returns the value of the expression that comes after the `return` keyword and exits. If however, the method definition does not contain the `return` keyword, the value of the expression of the last line is implicitly returned after method invocation.

```ruby
def a_method
	a = [1, 2, 3, 4]
	return a
	# explicit return
	puts "This line is never executed"
end

def a_method
	str = "hello"
	str << " world"
	# implicitly returns str
	str
end
```