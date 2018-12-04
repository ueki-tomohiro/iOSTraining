//: Playground - noun: a place where people can play

enum Gender: Int {
    case man
    case female
}

class User {
    var name:String
    var gender:Gender
    var era:Int
    var age:Int
    var visits:[Int]? = nil
    
    init? (dict: [String : Any?]) {
        guard let name = dict["name"] as? String,
        let era = dict["era"] as? Int,
        let age = dict["age"] as? Int,
        let gender = dict["gender"] as? Int else {
            return nil
        }
        self.name = name
        self.era = era
        self.age = age
        self.gender = gender == 1 ? Gender.man : Gender.female
    
        if let visits = dict["visits"] as? [Int] {
            self.visits = visits
        }
    }
    
    func print() {
        Swift.print(name)
        Swift.print(era)
        Swift.print(age)
        
        if let visits = visits {
            Swift.print(visits)
        }
    }
}

let dict: [String : [[String : Any?]]] = [
    "users" : [
        [
            "name" : "Dr. Emmett Brown",
            "gender" : 1,
            "era" : 1985,
            "age" : 65,
            "visits" : [
                1885, 1955, 1985, 2015
            ]
        ],
        [
            "name" : "Marty McFly",
            "gender" : 1,
            "era" : 1985,
            "age" : 17,
            "visits": [
                1885, 1955, 1985, 2015
            ]
        ],
        [
            "name" : "Lorraine Baines",
            "gender" : 0,
            "era" : 1955,
            "age" : 18,
            "visits": nil
        ]
    ]
]

var users: [User] = []

if let userDict = dict["users"] {
    for dict in userDict  {
        if let user = User(dict: dict) {
            users.append(user)
        }
    }
}

for user in users {
    user.print()
}
