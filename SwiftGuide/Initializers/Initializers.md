# Initializers

- initializers aka constructors are uses to create an object of a particular class, struct, enum

```swift
struct Person {
  let firstName: String
  let lastName: String
}

//example of Memberwise Initializer, only for structs
var josh = Person(firstName: "Josh", lastName: "Taylor")
josh.firstName
josh.lastName
```


- Note: We have to adhere to a few rules when working with initializers, but the most important one is that every stored property of a class or struct must have a value (or be nil) at the end of the init() function.


### Default Initializer

- default initializer, which will initialize an object with properties’ default values

### Memberwise Initializer

- Only available for Structs
- The memberwise initializer, which will synthesize an init() function based on a struct’s properties
