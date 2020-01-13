//
//  main.swift
//  sort
//
//  Created by Z on 1/9/20.
//  Copyright © 2020 Zyma. All rights reserved.

import Foundation

func sort(list: Array<Int>, in cores: Int)->Array<Int> {
    class SortMerge {
        private let controlQueue: ControlQueue
        private var listFirst: [Int]
        private var listSecond: [Int]
        private let cores: Int
        private let countList: Int
        private let lastIndexList: Int
        
        init(list: Array<Int>, in cores: Int) {
            listFirst = list
            listSecond = list
            self.cores = cores < 1 ? 1 : cores
            countList = list.count
            lastIndexList = countList - 1
            controlQueue = ControlQueue(cores: cores)
        }
        
        func merge( inList: inout [Int], outList: inout [Int], indexStart: Int, indexEnd: Int) {
            let countIndex = indexEnd - indexStart
            guard countIndex > 0 else { outList[indexStart] = inList[indexStart]
                //print("\n \(inList) inList\n", "\(outList) outList\n", "indexStart=\(indexStart)", "indexEnd=\(indexEnd) ---" )
                return
                
            }
            var newIndex = indexStart
            var leftIndex = indexStart
            let leftIndexEnd = indexStart + countIndex / 2
            var rightIndex = leftIndexEnd + 1
            while (newIndex <= indexEnd) {
                if (leftIndex > leftIndexEnd) {
                    if (!(rightIndex > indexEnd)) {
                        for i in rightIndex...indexEnd {
                            outList[i] = inList[i]
                        }
                    }
                    break
                }
                else if (rightIndex > indexEnd) {
                    if (!(leftIndex > leftIndexEnd)) {
                        for i in leftIndex...leftIndexEnd {
                            outList[newIndex] = inList[i]
                            newIndex += 1
                        }
                    }
                    break
                }
                else if (inList[leftIndex] < inList[rightIndex]) {
                    outList[newIndex] = inList[leftIndex]
                    leftIndex += 1
                }
                else if (inList[leftIndex] > inList[rightIndex]) {
                    outList[newIndex] = inList[rightIndex]
                    rightIndex += 1
                }
                else {
                    outList[newIndex] = inList[rightIndex]
                    newIndex += 1
                    outList[newIndex] = inList[leftIndex]
                    leftIndex += 1
                    rightIndex += 1
                }
                newIndex += 1
            }
           // print("\n \(inList) inList\n", "\(outList) outList\n", "indexStart=\(indexStart)", "indexEnd=\(indexEnd)---" )
        }
        
        class ControlQueueOld {
            var queue =  DispatchQueue(label: "sort.merger.corer1", qos: .userInteractive, attributes: .concurrent)
            //var queue =  DispatchQueue.global()
            func getQueue()->DispatchQueue {
                return queue
            }
        }
        
        class ControlQueue {
            var queue =  DispatchQueue(label: "sort.merger.cores", qos: .userInteractive, attributes: .concurrent)
            var queueControl =  DispatchQueue(label: "sort.merger.control", qos: .userInteractive)
            var cores: Int
            var items = [DispatchWorkItem?]()
            var _countCores: Int = 0
            var countCores: Int {
                get { return _countCores}
                set {
                    if _countCores < (cores-1) { _countCores = newValue }
                    else {_countCores = 0}
                }
            }
            
            init(cores: Int) {
                self.cores = cores
                countCores = 0
            }
            
            func getQueueItem(item: DispatchWorkItem)->DispatchQueue {
             /*   queueControl.sync {
                    if self.items.count < self.cores {
                        self.items.append(item)
                        self.countCores += 1
                    }
                    else {
                        self.items[self.countCores]?.wait()
                        self.items[self.countCores] = item
                        self.countCores += 1
                    }
                } */
                return queue
            }
            
            func getQueue()->DispatchQueue {
                return queue
            }
        }
        
        func mergeSort(flagRout: Bool, indexStart: Int, indexEnd: Int)->DispatchWorkItem? {
            let lengthIndexArray = indexEnd - indexStart
            
            let item = DispatchWorkItem {
                if flagRout {
                    self.merge( inList: &self.listSecond, outList: &self.listFirst, indexStart: indexStart, indexEnd: indexEnd)
                }
                else {
                    self.merge( inList: &self.listFirst, outList: &self.listSecond, indexStart: indexStart, indexEnd: indexEnd)
                }
                //print("\n \(self.listSecond) listSecond\n", "\(self.listFirst) listFirst\n","flagRout=\(flagRout)", "indexStart=\(indexStart)", "indexEnd=\(indexEnd)" )
            }
            let queue = controlQueue.getQueue()
            
            if lengthIndexArray > 0 {
                let middleIndex = indexStart + lengthIndexArray / 2
                let item1 = self.mergeSort(flagRout: !flagRout, indexStart: indexStart, indexEnd: middleIndex)
                let item2 = self.mergeSort(flagRout: !flagRout, indexStart: middleIndex+1, indexEnd: indexEnd)
            
                item1?.notify(queue: queue) {
                    item2?.notify(queue: queue, execute: item)
                }
            }
            else {
                queue.async(execute: item)
            }
            
            return item
        }
        
        func getSort()->[Int] {
            let item = mergeSort(flagRout: true, indexStart: 0, indexEnd: lastIndexList)
            item?.wait()
            return listFirst
        }
    }
    
    let sort = SortMerge(list: list, in: cores)
    
    return sort.getSort()
}

// ----TEST -------
// generate Array
func creatArray(count: Int)-> [Int] {
    let third = count // count / 2
    var array = [Int]()
    for i in 0..<third {
        array.append(i)
    }
    array = array.reversed()
    //for i in third..<count {
    //   array.append(i)
    //}
    return array
}

func creatRendomArray(count: Int)-> [Int] {
    var array = [Int]()
    for _ in 0..<count {
        array.append(Int.random(in: 1..<count))
    }
    return array
}

func test() {
    // cores
    let minCores = 1
    let maxCores = 1
    // count array
    let countArray = 1000000
    let test = creatRendomArray(count: countArray)
    //let test = creatArray(count: countArray)
    for cores in minCores...maxCores {
            let tStart = Date()
            let result = sort(list: test, in: cores)
            let tEnd = Date().timeIntervalSince(tStart)
            let testResult = test.sorted()
            let flag = (testResult == result)
            print("core=", cores, "countArray=", countArray, flag, "time=", tEnd, "sec")
            //print(testResult)
            //print(result)
    }
}

test()
