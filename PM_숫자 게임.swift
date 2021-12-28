//
//  PM_숫자 게임.swift
//  Algorithm
//
//  Created by dabeen on 2021/12/28.
//

import Foundation

func solution_숫자게임_1(_ a:[Int], _ b:[Int]) -> Int {
    //90.5 -> 효율성 1,2번 통과X
    var answer = 0
    var sortedA = a.sorted(by: >)
    var sortedB = b.sorted(by: >)
    
    while !sortedA.isEmpty {
        let firstA = sortedA.removeFirst()
        if firstA >= sortedB.first! {
            sortedB.removeLast()
        } else {
            sortedB.removeFirst()
            answer += 1
        }
    }
    
    return answer
}

func solution_숫자게임_2(_ a:[Int], _ b:[Int]) -> Int {
    var answer = 0
    var sortedA = a.sorted(by: <)
    var sortedB = b.sorted(by: >)
        
    while !sortedA.isEmpty {
        let lastA = sortedA.removeLast()        //removeFirst ->O(n) | removeLast -> O(1)
        if lastA >= sortedB.first! {
            sortedB.removeLast()
        } else {
            sortedB.removeFirst()
            answer += 1
        }
    }
    
    return answer
}

func solution_숫자게임_3(_ a:[Int], _ b:[Int]) -> Int {
    var answer = 0
    var sortedA = a.sorted(by: <)
    var sortedB = b.sorted(by: <)
        
    while !sortedA.isEmpty {
        if sortedA.removeLast() < sortedB.last! {
            sortedB.removeLast()
            answer += 1
        }
    }
    
    return answer
}

/* TODO : 4번과 5번 차이는...?? */
func solution_숫자게임_4(_ a:[Int], _ b:[Int]) -> Int {
    //얘는 시간초과
    var index = 0
    let sortedA = a.sorted()
    let sortedB = b.sorted()
    
    for targetB in sortedB {
        if targetB > sortedA[index] {
            index += 1
        }
    }
    return index
}

func solution_숫자게임_5(_ a:[Int], _ b:[Int]) -> Int {
    //얘는 성공
    let sA = a.sorted()
    let sB = b.sorted()
    
    var index = 0
    for tB in sB {
        if tB > sA[index] {
            index += 1
        }
    }
    return index
}
