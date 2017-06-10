//: Playground - noun: a place where people can play

import UIKit
import QuartzCore

//MARK: Helpers

class BenchTimer {
    static func measureBlock(_ closure: () -> Void) -> CFTimeInterval {
        let runCount = 10
        var executionTimes = Array(repeating: 0.0, count: runCount)
        
        for i in 0..<runCount {
            let startTime = CACurrentMediaTime()
            closure()
            let endTime = CACurrentMediaTime()
            let execTime = endTime - startTime
            executionTimes[i] = execTime
        }
        return executionTimes.reduce(0, +) / Double(runCount)
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

public extension Array {
    
    static func randomArray(size: Int, maxValue: Int) -> [Int] {
        var newArray = [Int]()
        
        for _ in 0..<size {
            newArray.append(Int(arc4random_uniform(UInt32(maxValue))))
        }
        return newArray
    }
    
    static func incrementArray(size: Int) -> [Int] {
        var array = [Int]()
        
        for i in 0..<size {
            array.append(i)
        }
        return array
    }
}



//MARK: Sorting algorithms
//bubble sort iterates through the array and swaps adjacent values. If swaps occured it repeats the process. When it iterates through the array without committing any swaps, it concludes that the list is sorted.

//Best case: the array is already sorted. The algorithm traverses the array once and no swaps are performed so the boolean stays false and ends. O(n)
//Worst case: the lowest value is at the last index and needs to be swapped n times before it can bubble back to the 0th index. This means that ((n-1) * n) / 2 swaps are made and n * n-1 compares. TOTAL: (3 * (n^2 - n)) / 2. The order of 0(n^2)
//While these run times look very similar to the insertion sort, it is important to notice how many more swaps need to occur. Remembering that write operations take longer to execute than read operations, the bubble sort will take considerably longer.


func bubbleSort(_ array: [Int]) -> [Int] {
    
    var arrayCopy = array
    
    var swaps: Bool = false
    
    repeat {
        swaps = false
        for i in 1..<arrayCopy.count {
            if arrayCopy[i] < arrayCopy[i - 1] {
                swap(&arrayCopy[i], &arrayCopy[i - 1])
                swaps = true
            }
        }
    } while swaps
    return arrayCopy
}

func insertionSort(_ array: [Int]) -> [Int] {
    var copyArray = array
    
    for sortedIndex in 1..<copyArray.count {
        var backIndex = sortedIndex
        while backIndex > 0 && copyArray[backIndex] < copyArray[backIndex - 1] {
            swap(&copyArray[backIndex], &copyArray[backIndex - 1])
            backIndex -= 1
        }
    }
    return copyArray
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



bubbleSort([6, 1, 8, 3, 2, 7, 9])

