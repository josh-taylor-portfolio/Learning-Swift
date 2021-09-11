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

- The memberwise initializer only works for structs, and not for classes. You’ll get it “for free” for structs, but not for classes!
- If you provide your own init() function, you lose the memberwise initializer. A solution here is to write your own, of course.
- You can use the memberwise initializer with and without default values for properties.

### Failable Initializers

- A failable initializer is an initializer function that may return nil, or may return a value. It’s the initializer equivalent of optionals. 
- Returns an optional

```swift 
class Sudent{
  let id: Int
  
  //returns an optional
  init?(id: String) {
     guard let id = Int(id) else {
        return nil
     }
     self.id = id
  }
}

let studentA = Student(id: "test")
studentA

let studentB = Student(id: "23456")
studentB?.id
