//
//  PM_소수찾기.swift
//  Algorithm
//
//  Created by dabeen on 2021/11/15.
//

import Foundation

func solution_소수찾기(_ numbers:String) -> Int {
    func makeNumber(_ targetNum:Int, _ num:String, _ numbers:[Int], _ primeNumbers: inout Set<Int>, _ visited: inout [Bool]) {
        if num.count == targetNum {
            if let num = Int(num), isPrimeNumber(num) {
                primeNumbers.insert(num)
            }
        } else {
            for i in 0..<numbers.count {
                if !visited[i] {
                    visited[i] = true
                    makeNumber(targetNum, num+"\(numbers[i])", numbers, &primeNumbers, &visited)
                    visited[i] = false
                }
            }
        }
    }

    func isPrimeNumber(_ num:Int) -> Bool {
        if num < 2 { return false}
        if num == 2 || num == 3 { return true }
        for i in 2..<Int(sqrt(Double(num)))+1 {
            if num % i == 0 { return false }
        }
        return true
    }
    
    let numbers = numbers.map{Int(String($0))!}
    var primeNumbers = Set<Int>()
    var visited = [Bool](repeating: false, count: numbers.count)

    for i in 1...numbers.count {
        makeNumber(i, "", numbers, &primeNumbers, &visited)
    }

    return primeNumbers.count
}

