import UIKit

//Linear time - an algorithm whose execution time is directly proportional to the input size.

class BenchTimer {
    public static func measureBlock(closure: () -> Void) -> CFTimeInterval {
        
        let numberOfExecutions = 10
        var executionTimes = Array<Double>(repeating: 0.0, count: numberOfExecutions)
        
        for i in 0..<numberOfExecutions {
            
            let beginTime = CACurrentMediaTime()
            closure()
            let endTime = CACurrentMediaTime()
            let executionTime = endTime - beginTime
            executionTimes[i] = executionTime
        }
        return executionTimes.reduce(0, +) / Double(numberOfExecutions)
    }
}



//#1 iterate through an array adding its elements.


func generateRandomArray(size: Int, maxValue: UInt32) -> [Int] {
    
    guard size > 0 else {
        return [Int]()
    }
    
    var array: [Int] = Array(repeating: 0, count: size)
    
    for i in 0..<size {
        
        array[i] = Int(arc4random_uniform(maxValue))
    }
    
    return array
}


func sumOfIntArray(_ array: [Int]) -> Int {
    var sum = 0
    
    for number in array {
        sum += number
    }
    return sum
}


//Test

let smallArray = generateRandomArray(size: 100, maxValue: UInt32.max)

var executionTime = BenchTimer.measureBlock {
    _ = sumOfIntArray(smallArray)
}
executionTime

let mediumArray = generateRandomArray(size: 1000, maxValue: UInt32.max)
executionTime = BenchTimer.measureBlock {
    _ = sumOfIntArray(mediumArray)
}

executionTime

let largeArray = generateRandomArray(size: 10000, maxValue: UInt32.max)
executionTime = BenchTimer.measureBlock {
    _ = sumOfIntArray(largeArray)
}

executionTime

let evenLargerArray = generateRandomArray(size: 100000, maxValue: UInt32.max)
executionTime = BenchTimer.measureBlock {
    _ = sumOfIntArray(evenLargerArray)
}

executionTime



