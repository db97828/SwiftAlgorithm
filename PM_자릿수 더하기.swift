//
//  PM_자릿수 더하기.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/21.
//

import Foundation

func solution_자릿수_더하기(_ n:Int) -> Int {
    return String(n).map{Int(String($0))!}.reduce(0, +)
}
