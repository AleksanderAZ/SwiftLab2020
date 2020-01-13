import UIKit
// lesson 06
// Exercise #1:
func goodMorning() {
    print("Good Morning")
}

// Exercise #2:
func printTotalWithTax(subtotal: Double) {
    let result = subtotal * 1.13
    print("result=",result)
}

// Exercise #3:
func getTotalWithTax(subtotal: Double)->Double {
    let result = subtotal * 1.13
    return result
}

// Exercise #4:
func calculateTotalWithTax(subtotal: Double, tax: Double)->Double {
    let result = subtotal * tax
    return result
}

goodMorning()
var subtotal: Double = 100
let tax = 1.13
printTotalWithTax(subtotal: subtotal)
subtotal = getTotalWithTax(subtotal: subtotal)/tax
printTotalWithTax(subtotal: subtotal)
subtotal = 1000
print("result=", calculateTotalWithTax(subtotal: subtotal, tax: tax))

