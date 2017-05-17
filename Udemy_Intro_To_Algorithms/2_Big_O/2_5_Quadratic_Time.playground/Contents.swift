//: Playground - noun: a place where people can play

import UIKit
import QuartzCore

//Describes an algorithm whose execution time is directly proportional to the square of the input size. It occurs when you have a nested loop iterating over an input. This is highly undesireable and should be avoided.

class BenchTimer {
    
    public static func measureBlock(closure: () -> Void) -> CFTimeInterval {
        
        let testCount = 10
        var testTimes = Array(repeating: 0.0, count: testCount)
        
        for i in 0..<testCount {
            let executionStart = CACurrentMediaTime()
            closure()
            let executionFinish = CACurrentMediaTime()
            let executionTime = executionFinish - executionStart
            testTimes[i] = executionTime
        }
        return testTimes.reduce(0, +) / Double(testCount)
    }
}

//Create an extension that converts the timeinterval to an easily readable string with the correct unit of measure from  nanoseconds to seconds.

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


func multTable(size: Int) -> [Int] {
    var table = [Int]()
    let array = [Int](1...size)
    
    
    for i in 0..<size {
        for j in 0..<size {
            let val = array[i] * array[j]
            table.append(val)
        }
    }
    return table
}


//var executeTime = BenchTimer.measureBlock {
//    _ = multTable(size: 10)
//}
//executeTime.formattedTime
//
//executeTime = BenchTimer.measureBlock {
//    _ = multTable(size: 100)
//}
//executeTime.formattedTime

//executeTime = BenchTimer.measureBlock {
//    _ = multTable(size: 1000)
//}
//executeTime.formattedTime

