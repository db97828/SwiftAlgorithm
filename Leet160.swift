//
//  160.swift
//  Algorithm
//
//  Created by dabeen on 2022/07/14.
//

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
 
class Solution_160 {
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var a = headA
        var b = headB

        while a !== b {
            a = a == nil ? headB : a?.next
            b = b == nil ? headA : b?.next
        }

        return a
    }
}
