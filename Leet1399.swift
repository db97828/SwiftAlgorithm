//
//  Leet1399.swift
//  Algorithm
//
//  Created by 최다빈 on 2022/08/16.
//

import Foundation

class Solution_1399 {
    func countLargestGroup_1(_ n: Int) -> Int {
        var answerList: [Int: Int] = [:]
    
        for i in 1...n {
            let temp = String(i).reduce(0) { $0 + (Int("\($1)") ?? 0) }
            answerList[temp, default: 0] += 1
        }

        let maxCount = answerList.values.max()
        return answerList.filter { $0.value == maxCount }.count
    }
    
    
    func countLargestGroup_2(_ n: Int) -> Int {
        var answerList: [Int: Int] = [:]

        for i in 1...n {
            let sum = getSumOfDigits(i)
            answerList[sum, default: 0] += 1
        }

        let maxCount = answerList.values.max()
        return answerList.filter { $0.value == maxCount }.count
    }

    func getSumOfDigits(_ n: Int) -> Int {
        var sum = 0
        var value = n
        while value > 0 {
            sum += value % 10
            value /= 10
        }
        return sum
    }

}
