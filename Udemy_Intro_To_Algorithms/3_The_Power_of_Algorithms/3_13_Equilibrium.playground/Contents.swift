//: Playground - noun: a place where people can play

import UIKit
import QuartzCore

class BenchTimer {
    static func measureBlock(_ closure: () -> Void) -> CFTimeInterval {
        
        let count = 10
        var execuationTimes = Array(repeating: 0.0, count: count)
        
        for i in 0..<count {
            let startTime = CACurrentMediaTime()
            closure()
            let endTime = CACurrentMediaTime()
            let executionTime = endTime - startTime
            execuationTimes[i] = executionTime
        }
        return execuationTimes.reduce(0, +) / Double(count)
    }
}

public extension CFTimeInterval {
    public var formattedTime: String {
        return self >= 1000 ? String(Int(self)) + "s"
            : self >= 1 ? String(format: "%.3gs", self)
            : self >= 1e-3 ? String(format: "%.3gms", self * 1e3)
            : self >= 1e-6 ? String(format: "%.3gµs", self * 1e6)
            : self < 1e-9 ? "0s"
            : String(format: "%.3gns", self * 1e9)
    }
}

//Problem: Find the index where everything to the left is equal to everything on the right.
//Example: A = [-3, 2, -2, 1, -2] index 1 (-3) and index 2 (-1)

//The worst case for this function is quadratic

func equilibrium(_ array: [Int]) -> [Int]? {
    
    guard array.count > 1 else {
        return nil
    }

    var indices = [Int]()
    
    var left: Int!
    var right: Int!
    
    for i in 0..<array.count {
     
        left = 0
        right = 0
        
        for j in 0..<i {
            left = left + array[j]
        }
        
        for j in i+1..<array.count {
            right = right + array[j]
        }

        if left == right {
            indices.append(i)
        }
        
    }
    return indices.isEmpty ? nil : indices
}



//The optimized function has a linear operation time in the order of 2n because of the reduce function and for loop.

func equilibriumOptimized(_ array: [Int]) -> [Int]? {
    
    var leftSum = 0
    var sum = array.reduce(0, +)
    let count = array.count
    
    var indices = [Int]()
    
    for i in 0..<count {
        
        sum = sum - array[i]
        
        if sum == leftSum {
            indices.append(i)
        }
        
        leftSum += array[i]
    }
    
    return indices.isEmpty ? nil : indices
}



//Comparison with 5 elements in array
let five  = [-3, 2, -2, 1, 2]

var execTime = BenchTimer.measureBlock {
    _ = equilibrium(five)
}

execTime.formattedTime

execTime = BenchTimer.measureBlock {
    _ = equilibriumOptimized(five)
}

execTime.formattedTime


//Comparison with 19 elements in array
let nineteen = [3, -8, 2, 9, 1, -6, 2, 6, 3, 4, -6, 1, -12, 57, 23, 12, -9, 67, 17]

execTime = BenchTimer.measureBlock {
    _ = equilibrium(nineteen)
}

execTime.formattedTime

execTime = BenchTimer.measureBlock {
    _ = equilibriumOptimized(nineteen)
}

execTime.formattedTime




