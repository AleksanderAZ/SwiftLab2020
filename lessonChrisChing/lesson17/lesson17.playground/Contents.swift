import UIKit

// lesson 17
var dict = ["CA":"California", "TX":"Texas"]
var arr = ["AL", "UT", "NY"]

for _ in 1...2 {
    print("hello")
}

for someVar in 1...10 {
    print(someVar)
}

for stateAbbrev in arr {
    print(stateAbbrev)
}

for arrIndex in 0...arr.count-1 {
    print("#\(arrIndex) is \(arr[arrIndex])")
}

for (abbrev, state) in dict {
    print("\(abbrev) is \(state)")
}

while arr.count <= 0 {
    arr.append("OH")
}
print(arr)

repeat {
    arr.append("OH")
} while arr.count <= 0
print(arr)


//lesson 16
dict = ["CA":"California", "TX":"Texas"]
var emptyDict = [String:String]()
dict["AL"] = "Alabama"
print(dict)

print(dict["AL"]!)
print(dict["CA"]!)
print(dict["NY"]!)
print(dict.count)

if dict["NY"] != nil {
    print(dict["NY"]!)
}

dict.removeValue(forKey: "CA")
print(dict)
dict["AL"] = nil
print(dict)



// lesson 15
class Person {
    var name:String?
    var age:Int?
    
    
    func getDriversLicense() -> String? {
        let age = self.age ?? -1
        if age > 16 && name != nil {
            return "C9S02J"
        }
        else {
            return nil
        } }
}


class Cop {
    func checkLicense(licenseNumber:String) -> Bool {
        if licenseNumber.count < 6 {
            return false
        }
        else {
            return true
        } }
}

let bob = Person()
let licenseNumber = bob.getDriversLicense()



// lesson 14
var array = [String]()
var array2 = ["e", "f"]

array.append("a")
array += ["b"]
array += ["c", "d"]
print(array)
array.append(contentsOf: array2)
print(array)

print(array[0])
print(array[1])
print(array.count)

array.remove(at: 0)
print(array)

array.remove(at: array.count-1)
print(array)

array.removeLast()
print(array)

print(array.removeFirst())
print(array)



// lesson 13
class Mammal {
    func sleep() {
        print("sleeping")
    }
    func eat() {
        print("eating")
    } }
let someMammal = Mammal()
someMammal.eat()
someMammal.sleep()

class Bear: Mammal {
    var furColor = ""
    func hibernate() {
        print("hibernating")
    }
    override func eat() {
        print("eating fish")
    } }
let aBear = Bear()
aBear.eat()
aBear.sleep()
aBear.hibernate()

class PolarBear: Bear {
    override init() {
        super.init()
        furColor = "white"
    }
    override func eat() {
        super.eat()
        print("also eating seals.")
    }
}
let mrPolarBear = PolarBear()
print(mrPolarBear.furColor)
mrPolarBear.eat()
mrPolarBear.sleep()
mrPolarBear.hibernate()

class GrizzlyBear: Bear {
    override init() {
        super.init()
        furColor = "brown"
    }
    override func eat() {
        super.eat()
        print("also eating berries and seeds.")
    } }
let mrGrizzly = GrizzlyBear()
print(mrGrizzly.furColor)
mrGrizzly.eat()
mrGrizzly.sleep()
mrGrizzly.hibernate()
