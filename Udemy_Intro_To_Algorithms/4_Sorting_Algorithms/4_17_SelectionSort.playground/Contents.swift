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


    func randomArray(size: Int, maxValue: Int) -> [Int] {
        
        var array = [Int]()
        
        for _ in 0..<size {
            array.append(Int(arc4random_uniform(UInt32(maxValue))))
        }
        return array
    }
    
    func incrementArray(size: Int) -> [Int] {
        var array = [Int]()
        
        for i in 0..<size {
            array.append(i)
        }
        return array
    }



func selectionSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    
    var copyArray = array
    
    for i in 0..<(array.count - 1) {

        var smallestIndex = i
        
        for j in i+1..<array.count {
            if copyArray[j] < copyArray[smallestIndex] {
                smallestIndex = j
            }
        }
        if smallestIndex != i {
            swap(&copyArray[smallestIndex], &copyArray[i])
            print(copyArray)
        }
    }
    return copyArray
}

var anotherExecTime = BenchTimer.measureBlock {
    _ = selectionSort(randomArray(size: 100, maxValue: 100))
}
anotherExecTime.formattedTime

//execTime = BenchTimer.measureBlock {
//    _ = selectionSort(randomArray(size: 1000, maxValue: 100))
//}
//execTime.formattedTime

var execTime = BenchTimer.measureBlock {
    _ = selectionSort(incrementArray(size: 100))
}
execTime.formattedTime
