>  Pseudo-code (both casual and formal)

    1. A method that returns the sum of two integers
    2. A method that takes an array of strings and returns a string which is the concatenation of all the other strings
    3. A method that takes an array of integers and returns a new array with every other element.

# Example 1

## Casual 

-Prompt user to enter first integer<br>
-Receive input number 1<br>
-Prompt user to enter second integer<br>
-Receive input number 2<br>
-Sum of number 1 and number 2

## Formal 

**START**

**PRINT** prompt to enter first integer<br>
**GET** first integer number1<br>
**PRINT** prompt to enter second integer<br>
**GET** second integer number2<br>

**SET** sum = **READ** number1 + **READ** number2

**END**

# Example 2

## Casual 

For a given array of strings

Iterate over the array of strings<br>
 -for each iteration, concatenate the string at position array[iterator] to the new string<br>

After iterating through the array, return the new string.

## Formal

**START** 

**SET** array = **READ** array argument passed into method<br>
**SET** joint_array = nil<br>
**SET** iterator = 1<br>
**WHILE** iterator <= array length<br>
**SET** joint_array = " " + array[iterator] + " "<br>

iterator = iterator + 1

**PRINT** final_array

**END**

# Example 3

## Casual

Given an array of integers 

Iterate over the array of integers<br>
return a new array

## Formal

**START**

**SET** array = **READ** array argument<br>
**SET** new_array = **READ** array

return new_array.
 

**END**

