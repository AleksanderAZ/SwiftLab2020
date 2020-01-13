import UIKit

protocol PoliceCodes {
    func nineOhTwo()
}

class Officer {
    var radio: PoliceCodes?
    
    func callItin() {
        radio?.nineOhTwo()
    }
    
}

class Dispatcher: PoliceCodes {
    
    func nineOhTwo() {
        print(" call 902")
    }
}


let o = Officer()
let d = Dispatcher()
o.radio = d
o.callItin()

