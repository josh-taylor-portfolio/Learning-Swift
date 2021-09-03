# Dictionaries

A dictionary stores associations between keys of the same type and values of the same type in a collection with no defined ordering. 

![dictionaries](https://user-images.githubusercontent.com/89819167/131957372-17cf8b49-a05e-4e2f-b86f-9c0650e43481.png)

# Creating an Empty Dictionary
```swift
var namesOfIntegers: [Int: String] = [:]
// namesOfIntegers is an empty [Int: String] dictionary

namesOfIntegers[16] = "sixteen"
// namesOfIntegers now contains 1 key-value pair

namesOfIntegers = [:]
// namesOfIntegers is once again an empty dictionary of type [Int: String]

```

# Creating a Dictionary with a Dictionary Literal

```swift
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

//or 

var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
```

# Accessing and Modifying a Dictionary

Use count to see the number of key value pairs in the dictionary
```swift
print("The airports dictionary contains \(airports.count) items.")
// Prints "The airports dictionary contains 2 items."
```

isEmpty is true when 0 key value pairs in stored inside the dictionary
```swift
if airports.isEmpty {
    print("The airports dictionary is empty.")
} else {
    print("The airports dictionary isn't empty.")
}
// Prints "The airports dictionary isn't empty."
```

Adding and updating an element
```swift
airports["LHR"] = "London"
// the airports dictionary now contains 3 items

airports["LHR"] = "London Heathrow"
// the value for "LHR" has been changed to "London Heathrow"

// updateValue(_:forKey:) method to set or update the value for a particular key and returns and Optional with the old value after performing an update
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}
// Prints "The old value for DUB was Dublin."

airports["APL"] = "Apple International"
// "Apple International" isn't the real airport for APL, so delete it
airports["APL"] = nil
// APL has now been removed from the dictionary

if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue).")
} else {
    print("The airports dictionary doesn't contain a value for DUB.")
}
// Prints "The removed airport's name is Dublin Airport."
```

Accesing an element
```swift
//access an element using the subscript method. This returns an optional because the element might not exist
if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName).")
} else {
    print("That airport isn't in the airports dictionary.")
}
// Prints "The name of the airport is Dublin Airport."
```

# Iterating Over a Dictionary
for-in loop
```swift
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
// LHR: London Heathrow
// YYZ: Toronto Pearson

//loop over keys
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}
// Airport code: LHR
// Airport code: YYZ

//loop over values
for airportName in airports.values {
    print("Airport name: \(airportName)")
}
// Airport name: London Heathrow
// Airport name: Toronto Pearson
```

Convert keys or values to array:
```swift
let airportCodes = [String](airports.keys)
// airportCodes is ["LHR", "YYZ"]

let airportNames = [String](airports.values)
// airportNames is ["London Heathrow", "Toronto Pearson"]
```

map()
```swift
let bookPrice = ["Harry Potter": 40, "Jungle Book": 10]

let bookDescriptions = bookPrice.map { (key: String, value: Int) in
    "\(key) is $\(value)"
}
//["Jungle Book is $10", "Harry Potter is $40"]
```

filter()
```swift
let filteredBookPrices = bookPrices.filter{ (key, value) -> Bool in
    key.hasPrefix("Harry") || value == 10
}
//["Harry Potter": 40, "Jungle Book": 10]
```

reduce()
```swift
let totalPriceOfAllBooks = bookPrices.reduce(0) { result, nextItem in
    result + nextItem.value
}

print(totalPriceOfAllBooks)
//50
