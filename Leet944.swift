//
//  Leet944.swift
//  Algorithm
//
//  Created by dabeen on 2022/08/29.
//

import Foundation

class Solution_944 {
    func minDeletionSize_1(_ strs: [String]) -> Int {
        let metrix: [[Character]] = strs.map { $0.map{ $0} }
        var answer: Int = 0
        var isSorted: Bool = true
        
        for c in 0..<metrix[0].count {
            isSorted = true
            for r in 0..<metrix.count-1 {
                if metrix[r][c] > metrix[r+1][c] {
                    isSorted = false
                    break
                }
            }
            if !isSorted { answer += 1 }
        }
        
        return answer
    }
    
    func minDeletionSize_2(_ strs: [String]) -> Int {
        let metrix: [[Character]] = strs.map { $0.map{ $0} }
        var answer: Int = 0
        
        for c in 0..<metrix[0].count {
            for r in 0..<metrix.count-1 {
                if metrix[r][c] > metrix[r+1][c] {
                    answer += 1
                    break
                }
            }
        }
        
        return answer
    }

}
