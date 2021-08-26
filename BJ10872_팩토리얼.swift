//
//  BJ10872_팩토리얼.swift
//  Algorithm
//
//  Created by dabeen on 2021/08/26.
//

import Foundation

func solution_팩토리얼() {
    print(factorial(Int(readLine()!)!))

    func factorial(_ num: Int) -> Int {
        if num == 0 {return 1}
        return num * factorial(num-1)
    }
}
