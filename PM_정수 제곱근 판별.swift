//
//  PM_정수 제곱근 판별.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/22.
//

import Foundation

func solution_정수_제곱근_판별(_ n:Int64) -> Int64 {
    //1
    if pow(floor(sqrt(Double(n))), 2) == Double(n) {
        return Int64(pow(sqrt(Double(n))+1.0, 2))
    } else { return -1 }
    
    //2
    return pow(floor(sqrt(Double(n))), 2) == Double(n) ? Int64(pow(sqrt(Double(n))+1.0, 2)) : -1
    
    //3
    let t = Int64(sqrt(Double(n)))
    return t * t == n ? (t+1)*(t+1) : -1
}
