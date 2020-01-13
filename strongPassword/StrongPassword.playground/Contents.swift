import Foundation

// Complete the minimumNumber function below.
func minimumNumber(n: Int, password: String) -> Int {
    // Return the minimum number of characters to make the password strong
    let numbers = "0123456789"
    let lower_case = "abcdefghijklmnopqrstuvwxyz"
    let upper_case = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let special_characters = "!@#$%^&*()-+"
    let checkingStrings = [numbers, lower_case, upper_case, special_characters]
    
    var minSize = 6
    if minSize < n { minSize = n }
    var lack = minSize - password.count
    if lack < 0 { lack = 0 }
    
    var lackChar = 0
    for check in checkingStrings {
        var flagIsContain = false
        for char in check {
            if password.contains(char) {
                flagIsContain = true
                break
            }
        }
        if !flagIsContain {
            lackChar += 1
        }
    }
    if (lack < lackChar) {
        lack = lackChar
    }
    return lack
}

let n = 3
let password = "Ab1"
let answer = minimumNumber(n: n, password: password)

print(answer)
