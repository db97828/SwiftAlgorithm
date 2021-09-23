//
//  PM_없는숫자더하기.swift
//  Algorithm
//
//  Created by dabeen on 2021/09/23.
//

import Foundation

func solution_없는_숫자_더하기_1(_ numbers:[Int]) -> Int {
    return (0...9).filter{!numbers.contains($0)}.reduce(0, +)
}

func solution_없는_숫자_더하기_2(_ numbers:[Int]) -> Int {
    return 45 - numbers.reduce(0, +)
}
