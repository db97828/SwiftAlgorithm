//
//  PM_소수찾기.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/25.
//

import Foundation

func solution_소수찾기(_ n:Int) -> Int {
    func isPrime(_ n:Int) -> Int {
        for i in 2...Int(sqrt(Double(n))) {
            if n % i == 0 { return 0}
        }
        return 1
    }
    
    return (2...n).map{ $0 < 4 ? 1 : isPrime($0) }.reduce(0, +)
}

