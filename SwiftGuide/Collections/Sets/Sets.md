# Sets
A set stores distinct values of the same type in a collection with no defined ordering.  
You can use a set instead of an array when the order of items isn’t important, or when you need to ensure that an item only appears once.  
Sets are unordered collections of unique values are always clear about the types of values and keys that they can store.  
Swift’s set types are implemented as generic collections.  

![Set](https://user-images.githubusercontent.com/89819167/131729428-eea1311e-fb1d-4f98-bd47-056f3f86af98.png)

# Hash Values for Set Types
1. A type must be hashable in order to be stored in a set—that is, the type must provide a way to compute a hash value for itself.  
2. A hash value is an Int value that’s the same for all objects that compare equally, such that if a == b, the hash value of a is equal to the hash value of b.  
3. All of Swift’s basic types (such as String, Int, Double, and Bool) are hashable by default, and can be used as set value types or dictionary key types.
4. Enumeration case values without associated values (as described in Enumerations) are also hashable by default.

# Set Type Syntax
1. The type of a Swift set is written as Set<Element>, where Element is the type that the set is allowed to store.  
2. Unlike arrays, sets don’t have an equivalent shorthand form.

# Creating and Initializing an Empty Set

You can create an empty set of a certain type using initializer syntax:
```swift
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")
// Prints "letters is of type Set<Character> with 0 items."  
  
letters.insert("a")
// letters now contains 1 value of type Character
letters = []
// letters is now an empty set, but is still of type Set<Character>
```

# Creating a Set with an Array Literal

You can also initialize a set with an array literal, as a shorthand way to write one or more values as a set collection.  
```swift 
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
// favoriteGenres has been initialized with three initial items
```
  
A set type can’t be inferred from an array literal alone, so the type Set must be explicitly declared. However, because of Swift’s type inference, you don’t have to write the type of the set’s elements if you’re initializing it with an array literal that contains values of just one type.  

```swift 
var favoriteGenres: Set = ["Rock", "Classical", "Hip hop"]
```
  
# Accessing and Modifying a Set
To find out the number of items in a set, check its read-only count property:  
```swift
print("I have \(favoriteGenres.count) favorite music genres.")
// Prints "I have 3 favorite music genres."
```
  
Use the Boolean isEmpty property as a shortcut for checking whether the count property is equal to 0:  
```swift
if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky.")
} else {
    print("I have particular music preferences.")
}
// Prints "I have particular music preferences."
```

Use insert(_:) method to insert into a set:
```swift
favoriteGenres.insert("Jazz")
// favoriteGenres now contains 4 items
```
  
Use remove(_:) to remove an item from a set. Returns the item if removed from set or nil if item is not in the set.  
```swift
if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}
// Prints "Rock? I'm over it."
```
  
Check if a set contains an object using contains(_:).
```swift
if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}
// Prints "It's too funky in here."
```

# Iterating Over a Set
for-in loop:
```swift
for genre in favoriteGenres {
  print("\(genre)")
}
// Classical
// Jazz
// Hip hop
```
  
Swift’s Set type doesn’t have a defined ordering. To iterate over the values of a set in a specific order, use the sorted() method, which returns the set’s elements as an array sorted using the < operator.  
```swift
for genre in favoriteGenres.sorted() {
    print("\(genre)")
}
// Classical
// Hip hop
// Jazz
```

# Performing Set Operations
