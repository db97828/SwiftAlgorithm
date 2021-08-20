//
//  BJ1065_한수.swift
//  Algorithm
//
//  Created by dabeen on 2021/08/20.
//

import Foundation

func solution한수() {
    let number = Int(readLine()!)!
    var answer = 0

    for i in 1...number {
        let numberArray = String(i).map{Int(String($0))!}
        
        if isHanNumber(numberArray) {answer += 1}
    }
    print(answer)

    func isHanNumber(_ num: [Int]) -> Bool {
        if num.count > 2 {
            let gap = num[1] - num[0]
            for i in 2..<num.count {
                if num[i] - num[i-1] != gap { return false }
            }
        }
        return true
    }
}
