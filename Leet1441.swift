//
//  Leet1441.swift
//  Algorithm
//
//  Created by 최다빈 on 2022/08/16.
//

import Foundation

class Solution_1441 {
    func buildArray_1(_ target: [Int], _ n: Int) -> [String] {
        var answer: [String] = []
        var index: Int = 0
        
        for i in 1...n {
            answer.append("Push")
            if target[index] == i {
                index += 1
                if index == target.count {
                    break
                }
            } else {
                answer.append("Pop")
            }
        }
        
        return answer
    }
    
    func buildArray_2(_ target: [Int], _ n: Int) -> [String] {
            var answer: [String] = []
            var index: Int = 0

            for i in 1...n {
                guard index < target.count else { return answer }
                answer.append("Push")
                if target[index] == i {
                    index += 1
                    continue
                }
                answer.append("Pop")
            }

            return answer
        }
}
