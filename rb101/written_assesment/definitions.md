**My own definitions**

`each` method:

The `Array#each` method when called on an array object iterates over each element of the array. For each element in the array, `each` passes the element into `do..end` which together with `each` form a block. The `do..end` chunk returns a value to `each` method though the method does nothing with this return value and it is simply ignored. The `each` method eventually returns the array object on which is was called

The `each` method is invoked on the object referenced by the local variable xxxx. The `each` method invocation together with the `do..end` chunk form a block. As the `each` method iterates over the object, every element is passed into the `do..end` successively as argument. The `do..end` returns a value though ignored `each`. Eventually, the `each` method invocation returns the object on which it was called on.

The `select` method is invoked on the Array object referenced by the local variable xxxx. The `select` method invocation together with the `do..end` form a block. For each iteration of `select` on the array object, the `do..end` chunk is executed once and a value is returned to the `select` method. The `select` method then returns a new array object comprised of elements for which the `do..end` returned a truthy statement. The other elements are ignored.

----------------------------------------------------

***Definitions given to me***

`Array#each`

 On line xxx the local variable xxxx is initialized to the Array object [xxxxx]. 
On line 3 the `each` method is invoked on the object referenced by the local variable xxx. 
The block is defined by the `do..end` keyword along side the `each` method invocation. `Array#each`
method iterates over the array object it is called on and executes the block for each element in 
the array. The `Array#each` method returns the original array object it was called upon. The 
return value of the block does not influence the return value of the `each` method.

For every iteration the `each` method passes the current element as an argument to the block which 
is assigned to the block parameter xxxxxx.

`Array#map`

 On line xxx the local variable xxxxx is initialized to the Array object [xxxxxx]. On line xxx 
the `map` method is invoked on the object referenced by the local variable xxxx.The block is 
defined by the `do..end` keyword along side the `map` method invocation. `Array#map` method 
iterates over the array object it is called on and executes the block for each element in the array. 
The `map` method returns a new array with elements *transformed* based on the return value of the block.
For every iteration the `map` method passes the current element as an argument to the block which it is assigned to the block parameter xxxxxx.
The `map` method iterates through the collections and returns a new collection transformed based on the return value of the block.

`Array#select`

 On line xxx the local variable xxxxx is initialized to the Array object [xxxxxx]. On line 3 the `select` method is invoked on the object referenced by the local variable xxxx. The block is defined by the `do..end` keyword along side the `select` method invocation. `Array#select` method iterates over the array and executes the block for each element in the array. The `Array#select` method returns a new array with the selected elements based on the *truthiness* of the return value of the block. If the return value of the block is truthy then the current element is selected. If the return value of the block evaluates to false then the current element is not selected.

For every iteration the `select` method passes the current element as an argument to the block which is assigned to the block parameter xxxxxx.

The `select` method iterates through the collections and returns a new collection based on the truthiness of the return value of the block.

`Hash#select`

On line xxx the local variable xxxxx is initialized to the `Hash` object {xxxxxxx}
The `select` method takes a block which is passed to it as an argument. The block is defined by the `do..end` keywords associated with the `select` method invocation. The `select` method iterates over the collection and passes each `key-value` pair as arguments to the block where they are `assigned` to the block parameters xxxxxx and xxxxxx. For every iteration the `select` method executes the block and selects the `key-value` pair if the return value of the block evaluates to true. If the block returns a `falsey` value then the `key-value` pair is not selected. The selected pairs are returned in a new hash.
The `select` method iterates through the collections and returns a new collection based on the `truthiness` of the return value of the block.