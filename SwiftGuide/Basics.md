# Type Safety and Type Inference
Swift is a type-safe language
```swift
// meaningOfLife is inferred to be of type Int
let meaningOfLife = 42

// pi is inferred to be of type Double
let pi = 3.14159
```
Gotcha - **Swift always chooses Double (rather than Float) when inferring the type of floating-point number**

If you combine integer and floating-point literals in an expression, a type of Double will be inferred from the context:
```swift
// anotherPi is also inferred to be of type Double
let anotherPi = 3 + 0.14159
```

# Constants and Variables

Constant and variable names can contain almost any character, including Unicode characters.

```swift
let name : String
let age = 55
var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"
```

## let vs var

**let** is a constant and cannot be changed after it's set
**var** is a variable that can be changed to another value of a compatible type

## Printing Constants (let) and Variables (var)
You can print the current value of a constant or variable with the print(_:separator:terminator:) function
```swift
print("The current value of friendlyWelcome is \(friendlyWelcome)")
// Prints "The current value of friendlyWelcome is Bonjour!"
```

# Comments

```swift
// This is a single line comment

/*
Multiple line comments
*/
```

# Semicolons

**Not** required but can be used to write multiple separate statements on a single line


# Integers
Integers are whole numbers with no fractional component, such as 42 and -23. Integers are either signed (positive, zero, or negative) or unsigned (positive or zero)
Swift provides signed and unsigned integers in 8, 16, 32, and 64 bit forms
1. On a 32-bit platform, Int is the same size as Int32.
2. On a 64-bit platform, Int is the same size as Int64.

# Floating-Point Numbers
Floating-point numbers are numbers with a fractional component, such as 3.14159, 0.1, and -273.15
Swift provides two signed floating-point number types:
1. Double represents a 64-bit floating-point number.
2. Float represents a 32-bit floating-point number.

# Numeric Literals
```swift
let decimalInteger = 17
let binaryInteger = 0b10001       // 17 in binary notation
let octalInteger = 0o21           // 17 in octal notation
let hexadecimalInteger = 0x11     // 17 in hexadecimal notation
```

# Type Aliases
Type aliases define an alternative name for an existing type
```swift
typealias AudioSample = UInt16
```

# Booleans
Swift has a basic Boolean type, called Bool
```swift
let orangesAreOrange = true
let turnipsAreDelicious = false
```

# Tuples
Tuples group multiple values into a single compound value.
Tuples are particularly useful as the return values of functions.
```swift
// http404Error is of type (Int, String), and equals (404, "Not Found")
let http404Error = (404, "Not Found")

// access items in touple
let httpCode = http404Error.0
```

# Optionals
You use optionals in situations where a value may be nil. An optional represents two possibilities: Either there is a value, and you can unwrap the optional to access that value, or there isn’t a value at all.
Use the ? to declare an optional

```swift 
// serverResponseCode contains an actual Int value of 404
var serverResponseCode: Int? = 404

// serverResponseCode now contains no value
serverResponseCode = nil
```

# Error Handling 
You use error handling to respond to error conditions your program may encounter during execution

```swift
func canThrowAnError() throws {
    // this function may or may not throw an error
}

do {
    try canThrowAnError()
    // no error was thrown
} catch {
    // an error was thrown
}
```
