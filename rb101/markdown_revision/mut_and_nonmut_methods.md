A method is said to be non-mutating with respect to an argument or its calling object if the method does not mutate the given object.

- All methods are non-mutating with respect to immutable objects.

- Assignment is non-mutating, it simply binds the variable on the LHS to the object on the RHS, so the variable now references the new object while the old object remains unchanged.

A method is said to be mutating with respect to an argument or its caller if it mutates its value in the process.

- Indexed assignment is mutating
- Concatenation is mutating
- Setters are mutating

With indexed assignment, the elements of a collection (or the characters of a String) are replaced; with setters, the state of the object is altered, usually by mutating or reassigning an instance variable. (How is indexed assignment similar to setters? )