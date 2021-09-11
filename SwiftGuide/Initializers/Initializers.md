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
- Returns an optional because nil = Optional.none

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
```

### Required Initializers

- A required initializer, like its name implies, is an initializer that you must implement if you’re subclassing.

```swift
class Vehicle {
    required init() {
        // this initializer must be implemented in a subclass, too
    }
}

class Car: Vehicle {
    required init() {
        // initialize this!
    }
}
```

### Designated Initializer

- Every class must have one designated initializer. 
- The class also has one initializer, the designated initializer, declared as init(radius:), which will assign the provided radius parameter to the property of the same name.

```swift
class Circle {
    
    var radius:Double
    var circumference:Double {
        2 * .pi * radius
    }

    init(radius: Double) {
        self.radius = radius
    }
}
```

### Convenience Initializers

- A class can have one or more convenience initializer, and they’re typically used in a scenario where adding a convenience initializer saves you time, or makes your code clearer or easier to use.

```swift
class Circle {
    
    var radius:Double
    var circumference:Double {
        2 * .pi * radius
    }

    init(radius: Double) {
        self.radius = radius
    }
    
    convenience init(circumference: Double) {
        self.init(radius: circumference / (.pi * 2))
    }
}
```

- The above init(circumference:) initializer, called a convenience initializer, takes a circumference parameter. Within the function body, the circumference of the circle is used to calculate its radius, which is provided to the designated initializer init(radius:).

### Few Rules for Initializers:

1. A designated initializer must call a designated initializer from its immediate superclass
2. A convenience initializer must call another initializer from the same class
3. A convenience initializer must ultimately call a designated initializer

* Another way of remembering these rules, is that designated initializers must always delegate up, and convenience initializers must always delegate across.
