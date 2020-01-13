import UIKit
import Foundation


// work variant  01     fastest
func biggerIsGreater(w: String) -> String {
    let lastIndex = w.count - 1
    guard lastIndex > 0 else { return "no answer" }
    var charArray = Array(w)
    var i = lastIndex
    
    while (charArray[i-1] >= charArray[i]) {
        i -= 1
        guard i > 0 else { return "no answer" }
    }
    let key = i-1
    let keyVal = charArray[key]
    charArray[i...].sort()
    var j = i
    while (!(keyVal < charArray[j])) {
        j += 1
    }
    charArray[key] = charArray[j]
    charArray[j] = keyVal
    return  String(charArray)
}

// work variant  09
func biggerIsGreater8(w: String) -> String {
    let size = w.count
    guard size > 1 else { return "no answer" }
    let lastIndex = size - 1
    var charArray = Array(w)
    var i = lastIndex
    while (charArray[i-1] >= charArray[i]) {
        i -= 1
        guard i > 0 else { return "no answer" }
    }
    let key = i-1
    var j = lastIndex
    let keyVal = charArray[key]
    while (keyVal >= charArray[j]) {
        j -= 1
    }
    charArray.swapAt(key, j)
    let result = String(charArray[0...key]) + String(charArray[i...lastIndex].reversed())
    return result
}
// work variant  02
func biggerIsGreater1(w: String) -> String {
    let size = w.count
    guard size > 1 else { return "no answer" }
    let lastIndex = size - 1
    var charArray = Array(w)
    var charArraySuffix = [Character]()
    var i = lastIndex
    while (charArray[i-1] >= charArray[i]) {
        charArraySuffix.append(charArray[i])
        i -= 1
        guard i > 0 else { return "no answer" }
    }
    charArraySuffix.append(charArray[i])
    let key = i-1
    var j = 0
    let keyVal = charArray[key]
    while (keyVal >= charArraySuffix[j]) {
        j += 1
    }
    charArray[key] = charArraySuffix[j]
    charArraySuffix[j] = keyVal
    let result = String(charArray[0...key]) + String(charArraySuffix)
    return result
}
// work variant  03
func biggerIsGreater2(w: String) -> String {
    let size = w.count
    guard size > 1 else { return "no answer" }
    let lastIndex = size - 1
    var charArray = Array(w)
    var charArraySuffix = [Character]()
    var i = lastIndex
    while (charArray[i-1] >= charArray[i]) {
        charArraySuffix.append(charArray[i])
        i -= 1
        guard i > 0 else { return "no answer" }
    }
    charArraySuffix.append(charArray[i])
    let key = i-1
    let keyVal = charArray[key]
    let j = charArraySuffix.firstIndex() {(c) in c > keyVal } ?? 0
    charArray[key] = charArraySuffix[j]
    charArraySuffix[j] = keyVal
    let result = String(charArray[0...key]) + String(charArraySuffix)
    return result
}
// work variant  04
func biggerIsGreater3(w: String) -> String {
    let size = w.count
    guard size > 1 else { return "no answer" }
    var i = w.index(before: w.endIndex)
    while(w[w.index(before: i)] >= w[i]) {
        i = w.index(before: i)
        if i == w.startIndex { return "no answer" }
    }
    let keyIndex = w.index(before: i)
    let key = w[keyIndex]
    let suff = w.suffix(from: i)
    let j = suff.lastIndex() {(c) in c > key } ?? suff.startIndex
    var xvost = w[keyIndex...keyIndex]
    if w[i...j].count > 1 { xvost = w[i...w.index(before: j)] + xvost }
    if w[j...].count > 1 { xvost = xvost + w[w.index(after: j)...] }
    var xv = String(xvost)
    if suff.count > 1 { xv = String(xv.reversed()) }
    var pref = w[j...j]
    if w[...keyIndex].count > 1 {pref = w[...w.index(before: keyIndex)] + pref}
    let result = String(pref) + xv
    return result
}
// work variant  05
func biggerIsGreater4(w: String) -> String {
    let size = w.count
    let lastIndex = size - 1
    var charArray = Array(w)
    var i = lastIndex
    guard i > 0 else { return "no answer" }
    while (charArray[i-1] >= charArray[i]) {
        i -= 1
        guard i > 0 else { return "no answer" }
    }
    let key = i-1
    let keyVal = charArray[key]
    charArray[key...].sort()
    var j = key
    while ((j <= lastIndex) ) {
        if (keyVal < charArray[j]) {
            let pref = key > 0 ? String(charArray[0...key-1]) : ""
            let presuff = j > 0 ? String(charArray[key...j-1]) : ""
            let suff = j<lastIndex ? String(charArray[(j+1)...]) : ""
            return  String(pref + String(charArray[j]) + presuff + suff)
        }
        j += 1
    }
    return "no answer"
}

// work variant  06
func biggerIsGreater5(w: String) -> String {
    let size = w.count
    guard size > 1 else { return "no answer" }
    var tempString = ""
    var i = w.index(before: w.endIndex)
    while(!(w[w.index(before: i)] < w[i])) {
        tempString.append(w[i])
        i = w.index(before: i)
        if i == w.startIndex { return "no answer" }
    }
    tempString.append(w[i])
    let keyIndex = w.index(before: i)
    let key = w[keyIndex]
    let j = tempString.firstIndex() {(c) in c > key } ?? tempString.startIndex
    var result = ""
    if keyIndex != w.startIndex { result = String(w.prefix(upTo: keyIndex))}
    result = result + String(tempString[j])
    if j != tempString.startIndex { result = result + String(tempString.prefix(upTo: j))}
    result = result + String(key)
    if j != tempString.index(before: tempString.endIndex) { result = result + String(tempString.suffix(from: tempString.index(after: j)))}
    return result
}
// work variant  07
func biggerIsGreater6(w: String) -> String {
    let size = w.count
    guard size > 1 else { return "no answer" }
    var tempString = [Character]()
    var i = w.index(before: w.endIndex)
    while(!(w[w.index(before: i)] < w[i])) {
        tempString.append(w[i])
        i = w.index(before: i)
        if i == w.startIndex { return "no answer" }
    }
    tempString.append(w[i])
    let keyIndex = w.index(before: i)
    let key = w[keyIndex]
    let j = tempString.firstIndex() {(c) in c > key } ?? tempString.startIndex
    let t = tempString[j]
    tempString[j] = key
    var result = ""
    if keyIndex != w.startIndex { result = String(w.prefix(upTo: keyIndex))}
    result = result + String(t)
    result = result + String(tempString)
    return result
}

// work variant  08
func biggerIsGreater7(w: String) -> String {
    let size = w.count
    let lastIndex = size - 1
    var charArray = Array(w)
    var i = lastIndex
    guard i > 0 else { return "no answer" }
    while (charArray[i-1] >= charArray[i]) {
        i -= 1
        guard i > 0 else { return "no answer" }
    }
    let key = i-1
    let keyVal = charArray[key]
    charArray[key...].sort()
    var j = key
    while (!(keyVal < charArray[j])) {
        j += 1
    }
    
    let pref = key > 0 ? String(charArray[0...(key-1)]) : ""
    let presuff = j > 0 ? String(charArray[key...(j-1)]) : ""
    let suff = j<lastIndex ? String(charArray[(j+1)...]) : ""
    return  pref + String(charArray[j]) + presuff + suff
}

// NOT work variant
/*
 func permute(str: inout [Character], n: Int) {
 let lastIndex = n
 var i = lastIndex
 while (str[i-1] >= str[i]) {
 str.swapAt(i, i-1)
 i -= 1
 }
 str.swapAt(lastIndex, lastIndex-1)
 permute(str: &str, n: n)
 }
 */


// TEST
var x = "abb"
for _ in 0...100 {
    let x0 = biggerIsGreater(w: x)
    let x1 = biggerIsGreater8(w: x)
    let x2 = biggerIsGreater7(w: x)
    print("--------",x, x0, "-", x1, "-", x2, "==", x0==x1, "==", x0==x2)
    x = x0
    if (x == "no answre") { break }
}

func test(xx: String, n: Int, function: (String)->String)->Double {
    let t = Date()
    var x = xx
    for _ in 0...n {
        x = function(x)
        if (x == "no answre") { break }
    }
    return Date().timeIntervalSince(t)
}
let xx = "zzzzabcdefgggfffffkkkkkkksssssssssooooooollllltrderrrrrrrr"
let n = 3000
for i in 0...10 {
    var timeingArray = [Double]()
    timeingArray.append(test(xx: xx, n: n, function: biggerIsGreater8))
    timeingArray.append(test(xx: xx, n: n, function: biggerIsGreater1))
    timeingArray.append(test(xx: xx, n: n, function: biggerIsGreater2))
    timeingArray.append(test(xx: xx, n: n, function: biggerIsGreater3))
    timeingArray.append(test(xx: xx, n: n, function: biggerIsGreater4))
    timeingArray.append(test(xx: xx, n: n, function: biggerIsGreater7))
    timeingArray.append(test(xx: xx, n: n, function: biggerIsGreater))
    let min = timeingArray.min() ?? -1
    let number = timeingArray.index(of: min) ?? -1
    print(timeingArray)
    print(number, min)
    print("---- end times: \(i) ---------")
}

