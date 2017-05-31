//: Playground - noun: a place where people can play

import UIKit

public class BenchTimer {
    
    static func measureBlock(closure:() -> Void) -> TimeInterval {
    
        let runCount = 10
        var executionTimes = Array<Double>(repeating: 0.0, count: runCount)
        for i in 0..<runCount {
            let startTime = CACurrentMediaTime()
            closure()
            let endTime = CACurrentMediaTime()
            let execTime = endTime - startTime
            executionTimes[i] = execTime
        }
        return (executionTimes.reduce(0, +)) / Double(runCount)
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

//Pair Matching: The challenge is to find two elements in an array that, when added together equal is the same as out target value.
//eg: array: [1,2,2,3,4] target: 4 will yield the indices (0, 3) and (1, 2)

func findTwoSum(_ array: [Int], target: Int) -> (Int, Int)? {
    
    guard array.count > 0 else {
        return nil
    }
    
    for i in 0..<array.count {
        let left = array[i]
        for j in (i + 1)..<array.count {
            let right = array[j]
            if left + right == target {
                return (i, j)
            }
        }
    }
    return nil
}


let array = [1,2,2,3,4]
if let indices = findTwoSum(array, target: 4) {
    print(indices)
} else {
    print("No pairs found")
}

//This initial approach will use quadratic time, as you can see by the nested for loops. Specifically: (n^2 + n) / 2. Here is how we work it out.

//The outer loop iterates through the entire array of n iterations
//



