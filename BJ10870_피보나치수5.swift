//
//  BJ10870_피보나치수5.swift
//  Algorithm
//
//  Created by dabeen on 2021/08/26.
//

import Foundation

func solution_피보나치수5() {
    print(fibo(Int(readLine()!)!))

    func fibo(_ num: Int) -> Int {
        if num == 0 {return 0}
        if num == 1 {return 1}
        return fibo(num-1) + fibo(num-2)
    }
}
