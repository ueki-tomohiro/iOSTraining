//: Playground - noun: a place where people can play

let h: String? = "H"
let ell = "ell"
let o: String? = "o"
var world: String! = nil
world = " world!"

if let hwrap = h, let owrap = o {
    let helloWorld = hwrap + ell + owrap + world
    print(helloWorld)
}
