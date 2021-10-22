//
//  PM_점프.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/22.
//

import Foundation

func solution_점프와_순간_이동_1(_ n:Int) -> Int {
    var n = n
    var answer = 0
    while n > 0 {
        if n % 2 == 0 { n /= 2 }
        else {
            n -= 1
            answer += 1
        }
    }
    return answer
}

func solution_점프와_순간_이동_2(_ n:Int) -> Int {
    if n == 1 { return 1 }
    if n % 2 == 0 { return solution_점프와_순간_이동_2(n/2) }
    return solution_점프와_순간_이동_2(n/2) + 1
}

