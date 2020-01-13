import UIKit

func substrings(n: String) -> Int {
    let sizeN = n.count
    let m = 1000000007
    var d = n
    var sum = ((Int(d.suffix(1)) ?? 0) * sizeN) % m
    d.removeLast()
    var x = 1
    var j = sizeN - 1
    while (j > 0) {
        let numbInt = Int(d.suffix(1)) ?? 0
        x = (((x * 10) % m) + 1) % m
        sum = (sum + (numbInt * j * x) % m) % m
        j = j - 1
        d.removeLast()
    }
    return Int(sum)
}

var n = "16"

let x = substrings(n: n)

print(x)





