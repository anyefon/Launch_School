Variables are merely references for objects in memory

```ruby
greeting = 'Hello'
```
The `string` object whose value is `Hello` is assigned to the local variable `greeting`, hence `greeting` references the `string` object by storing the object id.

```ruby
greeting = whazzup

greeting = 'Dude!'
```
Reassignment of a variable doesn't mutate the object it was referencing, rather it simply breaks the binding to the previous `string` object `Hello` and establishes a new link to the new `string` object `Dude!`.

***Reassignment operation doesn't mutate the object, it simply changes the object referenced by the variable***

In ruby, `numbers` and `booleans` are immutable objects (also `nil` and `range objects`). That is their values cannot be changed. Methods can only change the objects the variables are referencing to and bind them to different objects.

***Mutable objects are objects of a Class that  permits the alteration the object's state or value***