//
//  PM_3진법뒤집기.swift
//  Algorithm
//
//  Created by dabeen on 2021/09/17.
//

import Foundation

func solution_3진법_뒤집기(_ n:Int) -> Int {
    return Int(String(String(n, radix: 3).reversed()), radix: 3)!
}
