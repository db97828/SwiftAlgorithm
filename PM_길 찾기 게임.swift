//
//  PM_길 찾기 게임.swift
//  Algorithm
//
//  Created by dabeen on 2021/11/11.
//

import Foundation

func solution_길_찾기_게임(_ nodeinfo:[[Int]]) -> [[Int]] {
    let sortedNodeinfo = nodeinfo.enumerated().sorted(by: { $0.element[1] > $1.element[1] })
    let tree = Node(sortedNodeinfo[0])
    for info in sortedNodeinfo.dropFirst() {
        tree.addChild(info)
    }
    return [preOrder(tree), postOrder(tree)]
}

func preOrder(_ node:Node) -> [Int] {
    var order = [node.index]
    if let leftNode = node.leftNode {
        order.append(contentsOf: preOrder(leftNode))
    }
    if let rightNode = node.rightNode {
        order.append(contentsOf: preOrder(rightNode))
    }
    return order
}

func postOrder(_ node:Node) -> [Int] {
    var order = [Int]()
    if let leftNode = node.leftNode {
        order.append(contentsOf: postOrder(leftNode))
    }
    if let rightNode = node.rightNode {
        order.append(contentsOf: postOrder(rightNode))
    }
    order.append(node.index)
    return order
}

class Node {
    var index:Int
    var value:[Int]
    var leftNode:Node?
    var rightNode:Node?
    var parent:Node?
    
    init(_ info:EnumeratedSequence<[[Int]]>.Element) {
        self.index = info.offset + 1
        self.value = info.element
    }
    
    func addChild(_ info:EnumeratedSequence<[[Int]]>.Element) {
        if info.element[0] < value[0] {
            guard leftNode != nil else {
                leftNode = Node(info)
                leftNode?.parent = self
                return
            }
            leftNode?.addChild(info)
        } else {
            guard rightNode != nil else {
                rightNode = Node(info)
                rightNode?.parent = self
                return
            }
            rightNode?.addChild(info)
        }
    }
}
