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
