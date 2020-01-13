import UIKit

func andProduct(a: Int, b: Int) -> Int {
    
    if a == 0 { return 0 }
    if a == b { return a }
    if b - a == 1 {return a & b }
    if b - a == 2 {return a & (a+1) & b }
    if (b / a) >= 2 { return 0 }
    
    let diff = b - a
    var i = 1
    var d = diff
    while (d > 1) {
        d = d / 2
        i += 1
    }
    let sizeDiff = i
    i = 1
    d = a
    while (d > 1) {
        d = d / 2
        i += 1
    }
    let sizeA = i
    i = 1
    var key = 1
    while (i<(sizeA-sizeDiff)) {
        key = key * 2 + 1
        i += 1
    }
    i = 0
    while (i<sizeDiff) {
        key = key * 2
        i += 1
    }
    
    let result = b & key & a
    
    return result
}

let z = [[1, 4000000000],
[1408, 1441],
[640, 646],
[128, 168],
[384, 472],
[2816, 2843],
[2560, 2561],
[256, 283],
[0, 64],
[2432, 2434],
[512, 620],
[1280, 1295],
[2688, 2803],
[3840, 3963],
[512, 567],
[384, 467],
[2560, 2623],
[1408, 1524],
[768, 835]]
for i in z {
    let result = andProduct(a: i[0], b: i[1])
    print(result, i[0], i[1])
}
/*
1408
640
128
384
2816
2560
256
0
2432
512
1280
2688
3840
512
384
2560
1408
768
*/
