//
//  PM_최댓값과 최솟값.swift
//  Algorithm
//
//  Created by dabeen on 2021/11/02.
//

import Foundation

func solution_최댓값과_최솟값_1(_ s:String) -> String {
    let s = s.split(separator: " ").map{ Int(String($0))! }
    return "\(s.min()!) \(s.max()!)"
}

func solution_최댓값과_최솟값_2(_ s:String) -> String {
    let s = s.split(separator: " ").map{ Int(String($0))! }.sorted()
    return "\(s.first!) \(s.last!)"
}
