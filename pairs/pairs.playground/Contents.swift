import UIKit
import Foundation

func pairs(k: Int, arr: [Int]) -> Int {
    
    var countPairs = 0
    var newArrAdd = arr + arr.map( { $0 + k})
    let lastIndexAdd = newArrAdd.count - 1
    
    if ( lastIndexAdd == 0 ) { return 0 }
    newArrAdd.sort()
    
    var i = 0
    while (i < lastIndexAdd) {
        if (newArrAdd[i] ==  newArrAdd[i+1]) {
            countPairs += 1
            i += 1
        }
        i += 1
    }
    
    return countPairs
}

let k = 2
let arr = [1, 5, 3, 4, 2]

var result = pairs(k: k, arr: arr)
print(result)
print("-------")
