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
    var visits:Array<Int>? = nil
    
    init?(dict: [String : Any?]) {
        name = dict["name"] as! String
        gender = dict["gender"] as! Int == 1 ? Gender.man : Gender.female
        era = dict["era"] as! Int
        age = dict["age"] as! Int
        
        if let v = dict["visits"] {
            if v != nil {
                self.visits = v as! Array<Int>?
            }
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
    for i in 0 ..< userDict.count  {
        users.append(User(dict: userDict[i])!)
    }
}

for i in 0 ..< users.count {
    let user = users[i]
    
    print(user.name)
    print(user.era)
    print(user.age)
    
    if let visits = user.visits {
        print(visits)
    }
}
