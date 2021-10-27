//
//  PM_예상 대진표.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/27.
//

import Foundation

func solution_예상_대진표_1(_ n:Int, _ a:Int, _ b:Int) -> Int {
    var answer = 0
    var a = Double(a)
    var b = Double(b)
    while true {
        answer += 1
        if round(a / 2.0) == round(b / 2.0) {
            break
        } else {
            a = round(a / 2.0)
            b = round(b / 2.0)
        }
    }
    
    return answer
}

func solution_예상_대진표_2(_ n:Int, _ a:Int, _ b:Int) -> Int {
    var answer = 0
    var a = a
    var b = b
    
    while a != b {
        a = (a+1) / 2
        b = (b+1) / 2
        answer += 1
    }

    return answer
}

func solution_예상_대진표_3(_ n:Int, _ a:Int, _ b:Int) -> Int {
    var answer = 0
    var a = a
    var b = b
    
    repeat {
        a = (a+1) / 2
        b = (b+1) / 2
        answer += 1
    } while a != b
    
    return answer
}
