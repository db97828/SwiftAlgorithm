//
//  Leet674.swift
//  Algorithm
//
//  Created by dabeen on 2022/05/23.
//

import Foundation

func findLengthOfLCIS(_ nums: [Int]) -> Int {
    var answer: Int = 1
    var count: Int = 1
    for i in 1..<nums.count {
        if nums[i-1] < nums[i] {
            count += 1
        } else {
            answer = max(answer, count)
            count = 1
        }
    }

    return max(answer, count)
}
