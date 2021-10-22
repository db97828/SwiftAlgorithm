//
//  PM_스킬체크level1.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/22.
//

import Foundation
//소수 찾는 문제 -> 최대 제곱근까지만 찾아주기
func solution_스킬체크_Level1_1(_ n:Int) -> Int {
    var answer = 0
    for i in 2...n {
        if i <= 3 { answer += 1 }
        else { answer += isPrime(i) }
    }
    return answer
}

func isPrime(_ n:Int) -> Int {
    for i in 2...Int(sqrt(Double(n))) {
        if n % i == 0 { return 0}
    }
    return 1
}
