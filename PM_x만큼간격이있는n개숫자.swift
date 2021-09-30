//
//  PM_x만큼간격이있는n개숫자.swift
//  Algorithm
//
//  Created by dabeen on 2021/09/30.
//

import Foundation

func solution_x만큼간격이있는n개의숫자_1(_ x:Int, _ n:Int) -> [Int64] {
    var answer = [Int64]()
    if x == 0 {
        return Array([Int64](repeating:0, count:n))
    }
    for i in stride(from: x, through: x*n, by: x) {
        answer.append(Int64(i))
    }
    return answer
}

func solution_x만큼간격이있는n개의숫자_2(_ x:Int, _ n:Int) -> [Int64] {
    var answer = [Int64]()
    for i in 1...n {
        answer.append(Int64(x*i))
    }
    return answer
}

func solution_x만큼간격이있는n개의숫자_3(_ x:Int, _ n:Int) -> [Int64] {
    return (1...n).map{Int64($0*x)}
}

