# Arrays
1. Arrays are ordered collections of values  
2. Arrays are always clear about the types of values and keys that they can store  
3. So you can’t insert a value of the wrong type into a collection by mistake  
4. It also means you can be confident about the type of values you will retrieve from a collection  
5. Arrays are implemented as generic collections  

![Arrays](https://user-images.githubusercontent.com/89819167/131692317-bc2a14b3-4390-435f-9b2d-86a155802e9f.png)

An array stores values of the same type in an ordered list. The same value can appear in an array multiple times at different positions.  

# Mutability
let = means it's size and contents can't be changed.  Note the object inside the collection can change state
var =  means that you can change (or mutate) the collection after it’s created by adding, removing, or changing items in the collection

# Creating

You can create an empty array of a certain type using initializer syntax:
```swift
var someInts: [Int] = []
print("someInts is of type [Int] with \(someInts.count) items.")
// Prints "someInts is of type [Int] with 0 items."

someInts = []
// someInts is now an empty array, but is still of type [Int]

var threeDoubles = Array(repeating: 0.0, count: 3)
// threeDoubles is of type [Double], and equals [0.0, 0.0, 0.0]

// Creating an Array by Adding Two Arrays Together
// You can create a new array by adding together two existing arrays with compatible types with the addition operator (+)  

var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
// anotherThreeDoubles is of type [Double], and equals [2.5, 2.5, 2.5]

var sixDoubles = threeDoubles + anotherThreeDoubles
// sixDoubles is inferred as [Double], and equals [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]

//Array Literals 
// The example below creates an array called shoppingList to store String values:

var shoppingList: [String] = ["Eggs", "Milk"]
// shoppingList has been initialized with two initial items
// or

var shoppingList = ["Eggs", "Milk"]
```

# Accessing and Modifying an Array
