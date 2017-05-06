//: Playground - noun: a place where people can play

import UIKit
import QuartzCore

//Benchmark Utility
//This is a utility class that measures the run times of our algorithms. We start the timer and then begin the execution of our algorithm in the closure. Once the algorithm has been executed we calculate the runtime and add it to our executionTimes array. We repeat this process ten times and then return the average run time. Note that we are using CACurrentMediaTime because it is not subject to changes in the external time reference.

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

//#1 Array First Element Check

func firstElementIsZero(array: [Int]) -> Bool {
    guard array.count != 0 else {
        return false
    }

    return array.first == 0 ? true : false
}

var smallArray = [1, 0, 0]
var execTime = BenchTimer.measureBlock {
    _ = firstElementIsZero(array: smallArray)
}
execTime


var mediumArray = Array<Int>(repeating: 0, count: 10000)
execTime = BenchTimer.measureBlock {
    _ = firstElementIsZero(array: mediumArray)
}

execTime

var largeArray = Array<Int>(repeating: 0, count: 1000000)
execTime = BenchTimer.measureBlock {
    _ = firstElementIsZero(array: largeArray)
}

execTime

//Notice that the difference in the run times for these three arrays is in the order of micro-seconds.



//#2 Dictionary Search
//Dictionaries use hash look up, so it should also be constant time execution.

//func generateDictionary(size: Int) -> Dictionary<String, Int> {
//    var dictionary = Dictionary<String, Int>()
//    
//    
//    for
//}


