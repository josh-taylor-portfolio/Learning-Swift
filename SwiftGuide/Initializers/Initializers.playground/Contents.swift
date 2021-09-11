import UIKit

struct Person {
    
    let firstName: String
    let lastName: String
    
}

//Memberwise Initialzer, only for structs

let josh = Person(firstName: "Josh", lastName: "Taylor")

josh

class RandomId{
    func genId() -> Int {
        return 346
    }
}

class Student {
    
    var id: Int
    var Name = "Josh"
    
    init(studentId: Int) {
        self.id = studentId
    }
    
    //The return type is an optional
    init?(id: String) {

        guard let id = Int(id) else {
            return nil
        }
        self.id = id
    }
    
    convenience init(randomInt: RandomId) {
        self.init(studentId: randomInt.genId())
    }
    
    
    
}

	




