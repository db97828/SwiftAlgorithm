//
//  PM_두개 뽑아서 더하기.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/20.
//

import Foundation

func solution_두_개_뽑아서_더하기_1(_ numbers:[Int]) -> [Int] {
    var answer = Set<Int>()
    for i in 0..<numbers.count-1 {
        for j in i+1..<numbers.count {
            answer.insert(numbers[i]+numbers[j])
        }
    }
    return Array(answer.sorted())
}

