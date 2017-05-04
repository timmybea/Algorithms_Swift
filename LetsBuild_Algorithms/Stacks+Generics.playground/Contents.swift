//: Playground - noun: a place where people can play

import UIKit

//A Stack is a LIFO structure with two functions push and pop


class Node<T> {
    let value: T
    var next: Node?
    init(value: T) {
        self.value = value
    }
}

class Stack<T> {
    
    var top: Node<T>?
    
    func push(value: T) -> T {
        let oldTop = top
        top = Node(value: value)
        top?.next = oldTop
        return (top?.value)!
    }
    
    func pop() -> T? {
        let oldTop = top
        top = top?.next
        return oldTop?.value
    }
    
    func peek() -> T? {
        return top?.value
    }
    
}

var stack = Stack<Int>()
stack.push(value: 1)
stack.push(value: 2)
stack.push(value: 3)

stack.pop()
stack.pop()
stack.pop()
stack.pop()

//MARK: Supporting generics

struct User {
    let name: String
    let username: String
}


let me = User(name: "Tim", username: "@timmy")
let tara = User(name: "Tara", username: "@tarab")

var userStack = Stack<User>()
userStack.push(value: me)
userStack.push(value: tara)

let poppedUser = userStack.pop()
poppedUser?.name







