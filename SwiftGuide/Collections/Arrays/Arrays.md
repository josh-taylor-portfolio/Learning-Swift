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

```swift
//You can create an empty array of a certain type using initializer syntax:
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
// The example below creates an array called shoppingList to store String values
// shoppingList has been initialized with two initial items
var shoppingList: [String] = ["Eggs", "Milk"]
// or
var shoppingList = ["Eggs", "Milk"]
```

# Accessing and Modifying an Array

```swift
// To find out the number of items in an array, check its read-only count property
print("The shopping list contains \(shoppingList.count) items.")
// Prints "The shopping list contains 2 items."

//Boolean .isEmpty() property as a shortcut for checking whether the count property is equal to 0
if shoppingList.isEmpty {
    print("The shopping list is empty.")
} else {
    print("The shopping list isn't empty.")
}
// Prints "The shopping list isn't empty."

//You can add a new item to the end of an array by calling the array’s append(_:) method
shoppingList.append("Flour")
// shoppingList now contains 3 items, and someone is making pancakes

//append an array of one or more compatible items with the addition assignment operator (+=)
shoppingList += ["Baking Powder"]
// shoppingList now contains 4 items

shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
// shoppingList now contains 7 items
//Retrieve a value from the array by using subscript syntax (zero based)

var firstItem = shoppingList[0]
// firstItem is equal to "Eggs"
//Use subscript syntax to change an existing value at a given index

shoppingList[0] = "Six eggs"
// the first item in the list is now equal to "Six eggs" rather than "Eggs"

//use subscript syntax to change a range of values at once, even if the replacement set of values has a different length than the range you are replacing
shoppingList[4...6] = ["Bananas", "Apples"]
// shoppingList now contains 6 items

//insert an item into the array at a specified index, call the array’s insert(_:at:) method
//insert(_:at:) method inserts a new item with a value of "Maple Syrup" at the very beginning of the shopping list, indicated by an index of 0

shoppingList.insert("Maple Syrup", at: 0)
// shoppingList now contains 7 items
// "Maple Syrup" is now the first item in the list

//remove an item from the array with the remove(at:) method and the item is returned
let mapleSyrup = shoppingList.remove(at: 0)
// the item that was at index 0 has just been removed
// shoppingList now contains 6 items, and no Maple Syrup
// the mapleSyrup constant is now equal to the removed "Maple Syrup" string

//Any gaps in an array are closed when an item is removed, and so the value at index 0 is once again equal to "Six eggs"
firstItem = shoppingList[0]
// firstItem is now equal to "Six eggs"

let apples = shoppingList.removeLast()
// the last item in the array has just been removed
// shoppingList now contains 5 items, and no apples
// the apples constant is now equal to the removed "Apples" string
```

# Iterating Over an Array

for-in loop:
```swift
for item in shoppingList {
    print(item)
}
// Six eggs
// Milk
// Flour
// Baking Powder
// Bananas
```

If you need the integer index of each item as well as its value, use the enumerated() method to iterate over the array instead  
enumerated() method returns a tuple composed of an integer and the item
```swift
for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1): \(value)")
}
// Item 1: Six eggs
// Item 2: Milk
// Item 3: Flour
// Item 4: Baking Powder
// Item 5: Bananas
```

