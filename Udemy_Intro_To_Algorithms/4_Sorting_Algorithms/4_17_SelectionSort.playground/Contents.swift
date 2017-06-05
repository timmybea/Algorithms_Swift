//: Playground - noun: a place where people can play

import UIKit
import QuartzCore

class BenchTimer {
    static func measureBlock(_ closure: () -> Void) -> CFTimeInterval {
        let runCount = 10
        var execTimes = Array(repeating: 0.0, count: runCount)
        
        for i in 0..<runCount {
            let startTime = CACurrentMediaTime()
            closure()
            let endTime = CACurrentMediaTime()
            let execTime = endTime - startTime
            execTimes[i] = execTime
        }
        return execTimes.reduce(0, +) / Double(runCount)
    }
}

func selectionSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    
    var copyArray = array
    
    for i in 0..<(array.count - 1) {
        
        var left = copyArray[i]
        var smallestIndex = i
        
        for j in i+1..<array.count {
            let right = copyArray[j]
            
            if right < left {
                smallestIndex = j
                left = copyArray[j]
            }
        }
        if smallestIndex != i {
            let smallestValue = copyArray[smallestIndex]
            copyArray[smallestIndex] = copyArray[i]
            copyArray[i] = smallestValue
            print(copyArray)
        }
    }
    return copyArray
}

let result = selectionSort([5, 2, 8, 4, 9, 1])
result
