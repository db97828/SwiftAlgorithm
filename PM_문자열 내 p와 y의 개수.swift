//
//  PM_문자열 내 p와 y의 개수.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/19.
//

import Foundation

func solution_문자열_내_p와_y의_개수_1(_ s:String) -> Bool {
    return s.filter{$0 == "p" || $0 == "P"}.count == s.filter{$0 == "y" || $0 == "y"}.count
}

func solution_문자열_내_p와_y의_개수_2(_ s:String) -> Bool {
    let s = s.lowercased()
    return s.filter{$0 == "p"}.count == s.filter{$0 == "y"}.count
}

func solution_문자열_내_p와_y의_개수_3(_ s:String) -> Bool {
    //얘가 젤 빠름
    let s = s.lowercased()
    var pCnt = 0
    var yCnt = 0
    s.forEach{
        if $0 == "p" { pCnt += 1}
        else if $0 == "y" { yCnt += 1}
    }
    return pCnt == yCnt
}
