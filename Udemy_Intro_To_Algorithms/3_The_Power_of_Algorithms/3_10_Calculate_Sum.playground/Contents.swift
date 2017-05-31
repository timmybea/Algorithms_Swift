//: Playground - noun: a place where people can play

import UIKit

public class BenchTimer {
    public static func measureBlock(closure:() -> Void) -> CFTimeInterval {
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

//Our goal is to find the sum of the natural numbers (unsigned ints) up to n.
//The brute force approach O(n): We iterate through every number in the series up to n adding it to our result variable.

func naturalSum(_ n: UInt) -> UInt {

    var result: UInt = 0
    for i in 1...n {
        result += i
    }
    return result
}

var executeTime = BenchTimer.measureBlock {
    _ = naturalSum(100)
}
executeTime.formattedTime

//executeTime = BenchTimer.measureBlock {
//    _ = naturalSum(1000)
//}
//executeTime.formattedTime
//
//
//executeTime = BenchTimer.measureBlock {
//    _ = naturalSum(10000)
//}
//executeTime.formattedTime



//The smart appoach: O(1)
//sum(n) = (n * (n + 1))/2

func constantTimeNaturalSum(_ n: UInt) -> UInt {
    return (n * (n + 1)) / 2
}


for i in 1...10 {
    
    let n = UInt(i * 1000)
    
    executeTime = BenchTimer.measureBlock {
        _ = constantTimeNaturalSum(n)
    }
    
    print("For input of size \(n), the runtime is \(executeTime.formattedTime)")
    
}