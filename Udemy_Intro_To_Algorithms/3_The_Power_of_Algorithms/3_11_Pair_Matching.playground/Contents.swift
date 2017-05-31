//: Playground - noun: a place where people can play

import UIKit

//Pair Matching: The challenge is to find two elements in an array that, when added together equal is the same as out target value.
//eg: array: [1,2,2,3,4] target: 4 will yield the indices (0, 3) and (1, 2)


//MARK: Setup methods
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


//MARK: Brute-force approach

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
    //print(indices)
} else {
    //print("No pairs found")
}

//This initial approach will use quadratic time, as you can see by the nested for loops. Specifically: (n^2 + n) / 2. Here is how we work it out.
//The outer loop iterates through the entire array of n iterations





//MARK: Optimized function
//In this optimized version we can perform the check with linear complexity because we are storing the values and indices in a dictionary as we traverse the array. Checking the to see if the right value is a key in the dictionary is a constant time because it is a hash function.

func optimizedFindTwoSum(_ array: [Int], target: Int) -> (Int, Int)? {
    
    guard array.count > 1 else {
        return nil
    }
    
    var diffs = Dictionary<Int, Int>()

    for i in 0..<array.count {
        
        let left = array[i]
        
        let right = target - left
        
        if let foundIndex = diffs[right] {
            return (i, foundIndex)
        } else {
            diffs[left] = i
        }
    }
    return nil
}

//MARK: Test!

//create random array
var size = 10
var target = 4
var maxValue: UInt32 = 4

func generateArray(size: Int, maxValue: UInt32) -> [Int] {
    var array = Array(repeating: 0, count: size)
    for i in 0..<size {
        array[i] = Int(arc4random_uniform(maxValue))
    }
    return array
}

var testArray = generateArray(size: size, maxValue: maxValue)


var executionTime = BenchTimer.measureBlock {
    _ = findTwoSum(testArray, target: Int(maxValue))
}
print("findTwoSum: for size = \(size), execution time = \(executionTime.formattedTime)")


executionTime = BenchTimer.measureBlock {
    _ = optimizedFindTwoSum(testArray, target: Int(maxValue))
}

print("OptimizedFindTwoSum: for size = \(size), execution time = \(executionTime.formattedTime)")

//For size 50
size = 50
target = 10
maxValue = 10

testArray = generateArray(size: size, maxValue: maxValue)

executionTime = BenchTimer.measureBlock {
    _ = findTwoSum(testArray, target: Int(maxValue))
}
print("findTwoSum: for size = \(size), execution time = \(executionTime.formattedTime)")


executionTime = BenchTimer.measureBlock {
    _ = optimizedFindTwoSum(testArray, target: Int(maxValue))
}

print("OptimizedFindTwoSum: for size = \(size), execution time = \(executionTime.formattedTime)")


//for size 100
size = 100
target = 50
maxValue = 50

testArray = generateArray(size: size, maxValue: maxValue)

executionTime = BenchTimer.measureBlock {
    _ = findTwoSum(testArray, target: Int(maxValue))
}
print("findTwoSum: for size = \(size), execution time = \(executionTime.formattedTime)")


executionTime = BenchTimer.measureBlock {
    _ = optimizedFindTwoSum(testArray, target: Int(maxValue))
}

print("OptimizedFindTwoSum: for size = \(size), execution time = \(executionTime.formattedTime)")


//for size 200
size = 200
target = 10
maxValue = 100

testArray = generateArray(size: size, maxValue: maxValue)

executionTime = BenchTimer.measureBlock {
    _ = findTwoSum(testArray, target: Int(maxValue))
}
print("findTwoSum: for size = \(size), execution time = \(executionTime.formattedTime)")


executionTime = BenchTimer.measureBlock {
    _ = optimizedFindTwoSum(testArray, target: Int(maxValue))
}

print("OptimizedFindTwoSum: for size = \(size), execution time = \(executionTime.formattedTime)")


//for size 500
size = 500
target = 100
maxValue = 60

testArray = generateArray(size: size, maxValue: maxValue)

executionTime = BenchTimer.measureBlock {
    _ = findTwoSum(testArray, target: Int(maxValue))
}
print("findTwoSum: for size = \(size), execution time = \(executionTime.formattedTime)")


executionTime = BenchTimer.measureBlock {
    _ = optimizedFindTwoSum(testArray, target: Int(maxValue))
}

print("OptimizedFindTwoSum: for size = \(size), execution time = \(executionTime.formattedTime)")




