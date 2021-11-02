//
//  PM_올바른 괄호 .swift
//  Algorithm
//
//  Created by dabeen on 2021/11/02.
//

import Foundation

func solution_올바른_괄호_1(_ s:String) -> Bool {
    //효율성 통과못함
    var queue = [String]()
    let s = s.map{String($0)}
    if s.first == ")" || s.last == "(" || s.count % 2 == 1 { return false }
    else {
        for i in 0..<s.count {
            if s[i] == "(" { queue.append(s[i]) }
            else {
                if queue.isEmpty { return false }
                else if queue.last == "(" { queue.popLast() }
            }
        }
    }
    return queue.isEmpty
}

func solution_올바른_괄호_2(_ s:String) -> Bool {
    // ( ) 두개밖에 없으므로 queue사용 안하고 count로 해도됨 -> ( 갯수보다 )의 갯수가 많아지면 올바른 괄호가 될 수 없음
    var count = 0
    if s.first == ")" || s.last == "(" || s.count % 2 == 1 { return false }
    for char in s {
        if char == "(" { count += 1 }
        else if char == ")" { count -= 1 }
        
        if count < 0 { return false }
    }
    return count == 0
}
