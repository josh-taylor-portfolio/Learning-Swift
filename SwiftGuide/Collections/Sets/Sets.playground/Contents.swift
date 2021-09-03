import UIKit

var words = Set<String>()

//User insert to add to a set
//returns tuple (inserted: Bool, memberAfterInsert: Element)
let result = words.insert("Buckeyes")

print(result.inserted)
//true if Buckeyes was inserted into the set

print(result.memberAfterInsert)
//returns the newMember if it was inserted into the set or the oldMember

//empty a set by assigning it to []
words = []

if words.isEmpty {
    print("words is empty")
} else {
    print("words is NOT empty")
}

//Creating a Set using literals
var bigTenTeams: Set = ["Hawkeyes", "Buckeyes", "Golden Gophers"]
//or
// var var bigTenTeams: Set<String> = ["Hawkeyes", "Buckeyes", "Golden Gophers"]

//Get the number of elements in a Set using count()
print("Number of teams in bigTenTeams set is \(bigTenTeams.count)")


//add element to set using insert(_:)
bigTenTeams.insert("Cornhuskers")

//remove(_:) to remove element
let removedItem = bigTenTeams.remove("TomCats")

if let removedItem = removedItem {
    print("\(removedItem) was removed")
} else {
    print("TomCats not found")
}

//contains(_:) to check if set contains element
if bigTenTeams.contains("Hawkeyes") {
    print("Hawkeyes found in set")
} else {
    print("Hawkeyes not found in set")
}

//for-in loop
for team in bigTenTeams.sorted(){
    print("\(team)")
}


//Performing Set Operations
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
let randomDigits: Set = [3, 5]

let oddPrimeUnion = singleDigitPrimeNumbers.union(oddDigits)
print(oddPrimeUnion.count)
// 6

let oddEvenSymmetricDifference = oddDigits.symmetricDifference(evenDigits)
// [1, 3, 5, 7, 9, 0, 2, 4, 6, 8]
print(oddEvenSymmetricDifference.count)
// 10

let evenSubtractingPrime = evenDigits.subtracting(singleDigitPrimeNumbers)
//[0, 4, 6, 8]
print(evenSubtractingPrime.count)

print(oddDigits.isDisjoint(with: evenDigits))

print(randomDigits.isSuperset(of: singleDigitPrimeNumbers))
//false, randomDigits doesn't contain all elements of singleDigitPrimeNumbers

print(singleDigitPrimeNumbers.isSuperset(of: randomDigits))
//true, singleDigitPrimeNumbers contains all elements of randomDigits

print(randomDigits.isSubset(of: singleDigitPrimeNumbers))
//true, randomDigits elements are all in the set singleDigitPrimeNumbers

//map()
//returns an array of Strings
let intString = evenDigits.map { int in
    String(int)
}
print(intString)

//reduce
//add all the elements in the singleDigitPrimeNumbers set and return the sum
let primeSum = singleDigitPrimeNumbers.reduce(0, +)

print(primeSum)
//17






