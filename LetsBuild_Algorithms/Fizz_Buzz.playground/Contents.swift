//: Playground - noun: a place where people can play

import UIKit

//for any number divisible by three, print "fizz"
//for any number divisible by five, print "buzz"
//for any number divisible by both three and five, print "fizz buzz"

func fizzBuzz(max: Int) {
    
    for i in 1...max {
        if i % 3 == 0 && i % 5 == 0 {
            print("fizzbuzz")
        } else if i % 3 == 0 {
            print("fizz")
        } else if i % 5 == 0 {
            print("buzz")
        } else {
            print("\(i)")
        }
    }
}

fizzBuzz(max: 20)