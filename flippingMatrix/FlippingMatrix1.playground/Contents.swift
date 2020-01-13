import UIKit

func flippingMatrix(matrix: [[Int]]) -> Int {
    let sizeM: Int = matrix.count
    let halfN: Int = sizeM/2
    guard sizeM == halfN * 2 else { print("ERROR"); return -1 }
    let n: Int = sizeM - 1
    let halfNArr: Int = halfN - 1
    var maxSum: Int = 0
    for i in 0...halfNArr {
        for j in 0...halfNArr {
            guard let max = [matrix[i][j],matrix[i][n-j], matrix[n-i][j], matrix[n-i][n-j]].max() else { return 0 }
            maxSum = maxSum + max
        }
    }
    return maxSum
}

var m = [[11,21,31,41,51,61],
         [12,22,32,42,52,62],
         [13,23,33,43,53,63],
         [14,24,34,44,54,64],
         [15,25,35,45,55,65],
         [16,26,36,46,56,66]]

    m = [[11,21,31,41],
         [12,22,32,42],
         [13,23,33,43],
         [14,24,34,44]]


m = [[0,0,0,0],
     [0,0,0,0],
     [0,0,0,0],
     [20,3,1,1]]

m = [[112, 42, 83, 119],
     [56, 125, 56, 49],
     [15, 78, 101, 43],
     [62, 98, 114, 108]]


print("------",flippingMatrix(matrix: m))




