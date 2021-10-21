//
//  PM_정수 내림차순으로 배치하기.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/21.
//

import Foundation

func solution정수_내림차순으로_배치하기(_ n:Int64) -> Int64 {
//1
    return Int64(String(n).map{String($0)}.sorted(by: >).joined())!
//2
    return Int64(String((String(n).sorted(by: >))))!
}
