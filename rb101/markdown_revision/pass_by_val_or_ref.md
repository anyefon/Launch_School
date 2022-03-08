what is object passing?

- Object passing is when a method is called and an expression passed in to the method as an argument. This expression is evaluated by ruby into an object and ruby makes this object available to the method for use. This is object passing.

what is a strict evaluation strategy for passing objects?

- With strict evaluation, every expression is evaluated and converted to an object before it is passed along to a method. Ruby uses strict evaluation exclusively.

- With pass by value object passing strategy, a copy of an object is created and it is that copy that gets passed around. Hence any changes made to the copy only affects the copy and the original remains unchanged.
- By contrast, with pass by reference, a reference to an object is passed around. This establishes an alias between the argument and the original object: both the argument and object refer to the same location in memory. If you mutate the argument, you also mutate the original object.