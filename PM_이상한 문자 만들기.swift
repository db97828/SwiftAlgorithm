//
//  PM_이상한 문자 만들기.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/25.
//

import Foundation

func solution_이상한_문자_만들기_1(_ s:String) -> String {
    //실패
    return s.split(separator: " ").map{$0.enumerated().map{
        $0.offset % 2 == 0 ? $0.element.uppercased() : $0.element.lowercased()
    }}.map{$0.joined()}.joined(separator: " ")
}

func solution_이상한_문자_만들기_2(_ s:String) -> String {
    var cnt = 0
    var answer = ""
    s.forEach{
        if $0 == " " {
            answer += String($0)
            cnt = 0
        }
        else {
            answer += cnt % 2 == 0 ? String($0.uppercased()) : String($0.lowercased())
            cnt += 1
        }
    }
    return answer
}

func solution_이상한_문자_만들기_3(_ s:String) -> String {
    //성공
    return s.components(separatedBy: " ").map { $0.enumerated().map { $0.offset % 2 == 0 ? $0.element.uppercased() : $0.element.lowercased() } }.map{ $0.joined() }.joined(separator: " ")
}
