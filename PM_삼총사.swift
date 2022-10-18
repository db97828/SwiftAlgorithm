//
//  PM_삼총사.swift
//  Algorithm
//
//  Created by 최다빈 on 2022/10/18.
//

import Foundation

class 삼총사 {
    func solution(_ number:[Int]) -> Int {
        return combination(number).filter { $0.reduce(0,+) == 0 }.count
    }

    func combination(_ element: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        
        func combi(_ index: Int, _ now: [Int]) {
            if now.count == 3 {
                result.append(now)
                return
            }
            
            for i in index..<element.count {
                combi(i + 1, now + [element[i]])
            }
        }
        combi(0, [])
        return result
    }
}
