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






