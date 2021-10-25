//
//  PM_약수의 합.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/25.
//

import Foundation

func solution_약수의_합(_ n:Int) -> Int {
    return n == 0 ? 0 : (1...n).filter{ n % $0 == 0 }.reduce(0, +)
}
