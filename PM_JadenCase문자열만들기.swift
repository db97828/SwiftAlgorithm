//
//  PM_JadenCase문자열만들기.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/01.
//

import Foundation

func solution_JadenCase_문자열만들기_1(_ s:String) -> String {
    var answer = ""
    var isFirst = true
    s.forEach{
        if $0 == " " {
            answer += String($0)
            isFirst = true
            return
        }
        answer += isFirst == true && $0.isLetter ? $0.uppercased() : $0.lowercased()
        isFirst = false
    }
    return answer
}

func solution_JadenCase_문자열만들기_2(_ s:String) -> String {
    //index와 value를 같이 얻을 수 있는 함수 -> enumerated()
    return Array(s).enumerated().map {
        if $0.offset == 0 || Array(s)[$0.offset - 1] == " " { return $0.element.uppercased() }
        else { return $0.element.lowercased() }
    }.joined()
}
