//
//  PM_두 정수 사이의 합.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/25.
//

import Foundation

func solution_두_정수_사이의_합_1(_ a:Int, _ b:Int) -> Int64 {
    return Int64(a == b ? a : a < b ? (a...b).reduce(0, +) : (b...a).reduce(0, +))
}

func solution_두_정수_사이의_합_2(_ a:Int, _ b:Int) -> Int64 {
    return Int64(max(a, b) - min(a, b) + 1) * Int64(a + b) / Int64(2)
}
