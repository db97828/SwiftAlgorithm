//
//  PM_최솟값 만들기.swift
//  Algorithm
//
//  Created by dabeen on 2021/11/02.
//

import Foundation

func solution_최솟값_만들기(_ A:[Int], _ B:[Int]) -> Int {
    return zip(A.sorted(by: >), B.sorted(by: <)).map{ $0 * $1 }.reduce(0, +)
}
