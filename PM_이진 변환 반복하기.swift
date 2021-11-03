//
//  PM_이진 변환 반복하기.swift
//  Algorithm
//
//  Created by dabeen on 2021/11/03.
//

import Foundation

func solution_이진_변환_반복하기_1(_ s:String) -> [Int] {
    var s = s
    var changeCnt = 0
    var removedZeroCnt = 0
    
    while s != "1" {
        removedZeroCnt += s.filter{ $0 == "0" }.count
        s = String(s.filter{ $0 != "0"}.count, radix: 2)
        changeCnt += 1
    }
    
    return [changeCnt, removedZeroCnt]
}

func solution_이진_변환_반복하기_2(_ s:String) -> [Int] {
    var s = s
    var changeCnt = 0
    var removedZeroCnt = 0
    
    while s != "1" {
        let length = s.count
        let remainCnt = s.filter{ $0 != "0" }.count
        
        removedZeroCnt += length - remainCnt
        s = String(remainCnt, radix: 2)
        changeCnt += 1
    }
    
    return [changeCnt, removedZeroCnt]
}
