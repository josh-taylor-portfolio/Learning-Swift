import UIKit

//let vs var

struct Person {
    var firstName: String
}

//let names = [Person(firstName: "Josh"),
//             Person(firstName: "Kyle"),
//             Person(firstName: "Nate")]

// cannot add, remove, or change an item
//names.remove(at: 0)
//names.append(Person(firstName: "Connor"))
//names[1] = Person(firstName: "Sarah")

var names = [Person(firstName: "Josh"),
             Person(firstName: "Kyle"),
             Person(firstName: "Nate")]

// can add, remove, or change an item
names.remove(at: 2)
names.append(Person(firstName: "Connor"))
names[1] = Person(firstName: "Sarah")
names += [Person(firstName: "Alexis")]

//Use isEmpty() to see if an array contains 0 elements
if names.isEmpty {
    print("names is empty")
} else {
    print("names has \(names.count) item(s)")
}

// Use a for-in loop to iterate over an array
for name in names {
    print(name.firstName)
}

for (index, name) in names.enumerated() {
    print("\(name.firstName) is at index \(index + 1)")
}

names.forEach{name in
    print(name.firstName)
}

let filterNames = names.filter { person in
    person.firstName.hasPrefix("Jo") || person.firstName.hasPrefix("Al")
}

filterNames.forEach { person in
    print("filtered Name: \(person.firstName)")
}

let allUpperCaseFirstNames = names.map { person in
    Person(firstName: person.firstName.uppercased())
}

allUpperCaseFirstNames.forEach { person in
    print("uppercased person first name: \(person.firstName)")
}


let allNamesString = names.reduce("") { result, person in
    if (result.isEmpty) {
        return result + person.firstName
    } else {
        return result + ", \(person.firstName)"
    }
}

print(allNamesString)
//"Josh, Sarah, Connor, Alexis"

//compactMap
let listOfNames = names.compactMap({$0.firstName})
print(listOfNames)
//["Josh", "Sarah", "Connor", "Alexis"]

// compactMap to remove nils

let numbers = ["3", "65", "0", "error", "11", "error"]

let results = numbers.map { Int($0) }
print(results)
//results contains nil values

let compactMapResults = numbers.compactMap{Int($0)}
print(compactMapResults)
// compactMapResults is of type [Int]









