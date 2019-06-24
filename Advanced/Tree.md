# Tree Structure

## Basic Tree Sample Code

~~~swift
import UIKit

class Node<T> {
    var value: T
    var children: [Node] = []
    weak var parent: Node?
    
    init(value: T) {
        self.value = value
    }
    
    func add(child: Node) {
        children.append(child)
        child.parent = self
    }
}

extension Node where T: Equatable {
    func search(value: T) -> Node? {
        if value == self.value {
            return self
        }
        for child in children {
            if let found = child.search(value: value) {
                return found
            }
        }
        return nil
    }
}

extension Node: CustomStringConvertible {
    
    var description: String {
        var text = "\(value)"
        if !children.isEmpty {
            text += " {" + children.map{ $0.description }.joined(separator: ", ") + "}"
        }
        return text
    }
}

let terran = Node(value: "terran")

let marines = Node(value: "marines")
let medics = Node(value: "medics")

terran.add(child: marines)
terran.add(child: medics)

print(terran)
~~~


