//
//  Leet350.swift
//  Algorithm
//
//  Created by dabeen on 2022/05/18.
//

import Foundation

class Solution {
    func intersec_1(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var answer: [Int] = []
        var nums2 = nums2
        for n in nums1 {
            if nums2.isEmpty { break }
            if let index = nums2.firstIndex(of: n) {
                answer.append(nums2.remove(at: index))
            }
        }

        return answer
    }

    func intersect_2(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var answer: [Int] = []
        var numDic: [Int:Int] = [:]
        for n in nums1 {
            numDic[n,default: 0] += 1
        }

        for n in nums2 {
            if let count = numDic[n] {
                answer.append(n)

                numDic[n] = count == 1 ? nil : count-1
            }
        }

        return answer
    }
}
