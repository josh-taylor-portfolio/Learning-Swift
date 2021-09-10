# Class vs Structs

### Class

- Reference Type, Instances of reference types on the other hand are a reference to some point in memory
- Not Thread Safe, unless all properties are marked with let aka constants
- When an instance of a class is made a constant, you can mutate any of its var properties

```swift

class Person() {
  var name: String
  
  init(name: String) {
    self.name = name
  }
}

//some function that takes in a Person reference

func updateName(person: Person) {
  // person is a reference to a person aka a pointer to the person
  // person object is updated outside the function
  person.name = "Josh"
}

//even if person is a constant(let), so you can change any properites even if it is a variable (var)
let person = Person("Josh")
person.name = "Peter"
```

### Struct

- Value Type, each instance is a unique copy
- Thread Safe
- When a value type property of a struct is made a constant, you can’t mutate any of its properties — even if the property is a variable.
- When a refer type property of a struct is made a constant, you can still change the reference type's properties

```swift
struct Person() {
  var name: String
  var refType: ReferenceType()
}

class ReferenceType() {
  var refType = RefType()
}

//some function that takes in a Person reference

func updateName(person: Person) {
  // person is copy of the person pass into updateName
  // since person is a copy it is not updated outside the function
  person.name = "Josh"
}

//person is a constant(let), so you cannot change any properites even if it is a variable (var)
let person = Person("Josh")
person.name = "Peter" // compiler error

``

### When should you choose a value type and when should you choose a reference type?

1. Structs for Models
2. Classes for behavior
