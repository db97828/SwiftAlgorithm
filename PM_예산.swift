//
//  PM_예산.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/19.
//

import Foundation

func solution_예산_1(_ d:[Int], _ budget:Int) -> Int {
    if d.reduce(0, +) <= budget { return d.count }
    var sum = 0
    var answer = 0
    d.sorted().forEach{
        sum += $0
        if sum <= budget { answer += 1}
        else { return }
    }
    return answer
}

func solution_예산_2(_ d:[Int], _ budget:Int) -> Int {
    var budget = budget
    
    return d.sorted().filter{
        budget -= $0
        return budget >= 0
    }.count
}
