import UIKit

protocol SpaceshipProtocol {
    func liftOff()
    func addFuel(fuel: Int)
    func thrust()
    func cruise()
}

class Spaceship: SpaceshipProtocol {
    private var fuelLevel: Int = 50
    
    func liftOff() {
        fuelLevel -= 50
        print("We have lift off!")
        print("Current Fuel Level at: \(fuelLevel)")
    }
    
    func addFuel(fuel: Int) {
        fuelLevel += fuel
        print("Fuel added")
        print("Current Fuel Level at: \(fuelLevel)")
    }
    
    func thrust() {
        fuelLevel -= 15
        print("Rocket is thrusting")
        print("Current Fuel Level at: \(fuelLevel)")
    }
    
    func cruise() {
        fuelLevel -= 5
        print("Rocket is cruising")
        print("Current Fuel Level at: \(fuelLevel)")
    }
}

let spaceship = Spaceship()
spaceship.addFuel(fuel: 50)
spaceship.liftOff()
spaceship.thrust()
spaceship.cruise()

class SpaceshipNew: SpaceshipProtocol {
    private var fuelLevel: Int = 50
    
    private func changeFuel(change: Int, result: (Bool)->()) {
        fuelLevel = fuelLevel + change
        if (fuelLevel < 0) {
            fuelLevel = 0
            result(false)
        }
        else {
            result(true)
        }
        
        print("New Current Fuel Level at: \(fuelLevel)")
    }
    
    func liftOff() {
        changeFuel(change: -50) { (result) in
            if result {
                print("New We have lift off!")
            }
            else {
                print("New We have not lift off!")
            }
        }
    }
    
    func addFuel(fuel: Int) {
        changeFuel(change: fuel) { (result) in print("New Fuel added") }
    }
    
    func thrust() {
        changeFuel(change: -15) { (result) in
            if result {
                print("New Rocket is thrusting")
            }
            else {
                print("New Accident!")
            }
        }
    }
    
    func cruise() {
        changeFuel(change: -5) { (result) in
            if result {
                print("New Rocket is cruising")
            }
            else {
                print("New Accident!")
            }
        }
    }
}
print("-------------------------------")
let spaceshipOld = Spaceship()
let spaceshipNew = SpaceshipNew()
let spaceships: [SpaceshipProtocol] = [spaceshipOld, spaceshipNew]

for spaceship in spaceships {
    spaceship.addFuel(fuel: 5)
    spaceship.liftOff()
    spaceship.thrust()
    spaceship.cruise()
}



