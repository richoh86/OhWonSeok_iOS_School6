import UIKit

struct Stack<Element> {
    
    fileprivate var array: [Element] = []
    
    // Computed Property
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    mutating func push(_ element: Element) {
        array.append(element)
    }
    
    mutating func pop() -> Element? {
        return array.popLast()
    }
    
    func peek() -> Element? {
        return array.last
    }
}

extension Stack: CustomStringConvertible {
    
    var description: String {
        let topDivider = "---Stack---\n"
        let bottomDivider = "\n-----------\n"
        
//        let stackElements = array.reversed().joined(separator: "\n")
        let stackElements = array.map { "\($0)"}.reversed().joined(separator: "\n")
        return topDivider + stackElements + bottomDivider
    }
    
}

var rwBookStack = Stack<String>()

rwBookStack.push("A")
rwBookStack.push("B")
rwBookStack.push("C")
rwBookStack.push("D")

print(rwBookStack)



