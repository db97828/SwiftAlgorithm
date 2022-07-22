//
//  191.swift
//  Algorithm
//
//  Created by dabeen on 2022/07/22.
//

import Foundation

class Solution_191 {
    func hammingWeight(_ n: Int) -> Int {
        var number = n
        var answer: Int = 0
        while number != 0 {
            answer += (number & 1 == 0 ? 0 : 1)
            number = number >> 1
        }
        return answer
    }
}
