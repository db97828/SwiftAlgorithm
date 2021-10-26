//
//  PM_문자열을 정수로 바꾸기.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/26.
//

import Foundation

func solution_문자열을_정수로_바꾸기_1(_ s:String) -> Int {
    return Int(s) != nil ? Int(s)! : s.dropFirst() == "-" ? Int(s)! * -1 : Int(s)!
}

func solution_문자열을_정수로_바꾸기_2(_ s:String) -> Int {
    return Int(s)!
}
