//
//  PM_k진수에서 소수 개수 구하기.swift
//  Algorithm
//
//  Created by 최다빈 on 2022/10/18.
//

import Foundation

class PM_K진수에서_소수_개수_구하기 {
    func solution(_ n:Int, _ k:Int) -> Int {
        let target = String(n, radix: k)
        let array = target.components(separatedBy: "0")
        return array.filter { isPrime($0) }.count
    }

    func isPrime(_ num: String) -> Bool {
        guard let num = Int(num), num != 1 else { return false }
        if num == 2 || num == 3 { return true }
        
        for i in 2...Int(sqrt(Double(num))) + 1 {
            if num % i == 0 && num != i { return false }
        }

        return true
    }
}

