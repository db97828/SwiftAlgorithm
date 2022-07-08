//
//  171.swift
//  Algorithm
//
//  Created by dabeen on 2022/07/07.
//

import Foundation

class Solution_171 {
    func titleToNumber_1(_ columnTitle: String) -> Int {
        let char = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map { $0 }
        let num = Array(1...26)
        let dic = zip(char, num).reduce(into: [:], { $0[$1.0] = $1.1 })

        var answer = 0
        for (index, value) in columnTitle.enumerated() {
            answer += dic[value]! * Int(pow(26, Float(columnTitle.count-index-1)))
        }

        return answer
    }
    
    func titleToNumber_2(_ columnTitle: String) -> Int {
        return columnTitle.unicodeScalars.reduce(0) { $0 * 26 + Int($1.value - 64) }
    }
}
