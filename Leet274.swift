//
//  Leet274.swift
//  Algorithm
//
//  Created by dabeen on 2022/08/29.
//

import Foundation

class Solution_274 {
    func hIndex_1(_ citations: [Int]) -> Int {
        var hIndex: Int = 0
        var answer: Int = 0
        let citations = citations.sorted()
        
        while hIndex < citations.count+1 {
            if citations.filter ({ $0 >= hIndex }).count >= hIndex {
                answer = hIndex
            }
            hIndex += 1
        }
        
        return answer
    }
    
    func hIndex(_ citations: [Int]) -> Int {
        let c = citations.count
        
        return citations.sorted()
            .enumerated()
            .reduce(into: Int(0), { $0 = $1.1 >= c - $1.0 ? max(c - $1.0, $0) : $0 })   // 더 공부해보기...
    }

}
