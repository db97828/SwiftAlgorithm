//
//  PM_자연수 뒤집어 배열로 만들기.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/21.
//

import Foundation


func solution_자연수_뒤집어_배열로_만들기(_ n:Int64) -> [Int] {
    return String(n).map{Int(String($0))!}.reversed()
}
