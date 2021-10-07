//
//  PM_피보나치수.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/07.
//

import Foundation

//시간초과
func solution피보나치수_1(_ n:Int) -> Int {
    func fibo(_ n:Int) -> Int {
        if n < 2 { return n }
        else { return fibo(n-1) + fibo(n-2) }
    }
    
    return fibo(n) % 1234567
}


//DP 이용해서 풀기
func solution피보나치수_2(_ n:Int) -> Int {
    var fiboDP = [0,1]
    
    for i in 2...n {
        fiboDP.append((fiboDP[i-2] + fiboDP[i-1]) % 1234567)
    }
    
    return fiboDP[n]
}
