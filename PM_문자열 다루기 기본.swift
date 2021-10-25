//
//  PM_문자열 다루기 기본.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/25.
//

import Foundation

func solution_문자열_다루기_기본_1(_ s:String) -> Bool {
    if s.count == 4 || s.count == 6 {
        for char in s {
            if !char.isNumber {return false}
        }
        return true
    }
    return false
}

func solution_문자열_다루기_기본_2(_ s:String) -> Bool {
    return Int(s) != nil && (s.count == 4 || s.count == 6) ? true : false
}

