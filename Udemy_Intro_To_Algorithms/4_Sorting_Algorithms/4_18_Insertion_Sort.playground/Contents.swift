//: Playground - noun: a place where people can play

import UIKit
import QuartzCore

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
        
        for i in 0..<size {
            newArray.append(Int(arc4random_uniform(UInt32(maxValue))))
        }
        return newArray
    }
}

func insertionSort(_ array: [Int]) -> [Int] {
    var copyArray = array
    
    for sortedIndex in 1..<copyArray.count {
        var backIndex = sortedIndex
        while backIndex > 0 && copyArray[backIndex] < copyArray[backIndex - 1] {
            swap(&copyArray[backIndex], &copyArray[backIndex - 1])
            backIndex -= 1
            //print(copyArray)
        }
    }
    return copyArray
}

var exec = BenchTimer.measureBlock {
    _ = insertionSort(Array<Int>.randomArray(size: 10, maxValue: 20))

}
exec.formattedTime

//Best case: The array is already sorted. The algorithm traverses the elements of the array, performs a single check and then continues on. No swaps are made. The will be O(n)

//Worst case: The array is in reverse order. The algorithm will make one swap on the first element, two on the second and so forth. This results in the number of swaps AND the number of checks being the sum of the natural numbers in a series up to n-1. Swaps = n^2 - n / 2 , checks: n^2 - n / 2 TOTAL: n^2 - n. When we remove the low order term, we are left with O(n^2)

//Average Case: The array is in a random order. This means that the checks and swaps will each be a natural sum up to n/2
//swaps: ((n - 1) * n) / 4   checks: ((n - 1) * n) / 4  TOTAL: n^2 - n / 2 Again a complexity of O(n^2)

//Why is selection sort so much faster than insertion sort?
//Both of these algorithms run in quadratic time, but selection sort is considerably faster as the input size increases. This is because (while selection sort makes more comparisons) it requires fewer swaps to take place. Selection sort's number of swaps grows linearly with the growth of the input whereas we have seen that insertion sort has swaps in the quadratic order. writing to memory is significantly slower than reading and so insertion sort which does more writing and less reading is slower.