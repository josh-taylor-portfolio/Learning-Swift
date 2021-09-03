import UIKit

//empty dictionary
var namesOfIntegers: [Int:String] = [:]

namesOfIntegers[10] = "ten"

if namesOfIntegers.isEmpty {
    print("The namesOfIntegers dictionary is empty.")
} else {
    print("The namesOfIntegers dictionary isn't empty.")
}
// Prints "The namesOfIntegers dictionary isn't empty."

//clear namesOfIntegers
namesOfIntegers = [:]

if namesOfIntegers.isEmpty {
    print("The namesOfIntegers dictionary is empty.")
} else {
    print("The namesOfIntegers dictionary isn't empty.")
}
// Prints "The namesOfIntegers dictionary isn empty."

//add an element to namesOfIntegers
namesOfIntegers[16] = "sixteen"
print(namesOfIntegers[16]!)

//update an element
namesOfIntegers[16] = "Sixteen"
print(namesOfIntegers[16]!)

//remove key value from dicitonary
namesOfIntegers[16] = nil

//Looping over a dictionary
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

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


let bookPrices = ["Harry Potter": 40, "Jungle Book": 10]

let bookDescriptions = bookPrices.map { (key: String, value: Int) in
    "\(key) is $\(value)"
}

print(bookDescriptions)

let filteredBookPrices = bookPrices.filter{ (key, value) -> Bool in
    key.hasPrefix("Harry") || value == 10
}

print(filteredBookPrices)

let totalPriceOfAllBooks = bookPrices.reduce(0) { result, nextItem in
    result + nextItem.value
}

print(totalPriceOfAllBooks)


