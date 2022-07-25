//
//  Leet237.swift
//  Algorithm
//
//  Created by dabeen on 2022/07/22.
//

import Foundation

class Solution_237 {
    class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }
    
    func deleteNode_1(_ node: ListNode?) {
        guard let currentNode = node, let nextNode = node?.next else { return }
        currentNode.val = nextNode.val
        currentNode.next = nextNode.next
    }
    
    func deleteNode_2(_ node: ListNode?) {
        node?.val = node?.next?.val ?? Int()
        node?.next = node?.next?.next
    }
}
