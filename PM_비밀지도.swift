//
//  PM_비밀지도.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/20.
//

import Foundation

func solution_비밀지도_1(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    
    for i in 0..<arr1.count {
        var line = String(arr1[i] | arr2[i], radix: 2)
        while line.count < n {
            line.insert("0", at: line.startIndex)
        }
        answer.append(
            line.replacingOccurrences(of: "0", with: " ")
            .replacingOccurrences(of: "1", with: "#"))
    }
    
    return answer
}

func solution_비밀지도_2(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    return (0..<n).map{
        let num = String(arr1[$0] | arr2[$0], radix: 2)
        let line = String(repeating: "0", count: n-num.count) + num
        return line.reduce(""){ $0 + ($1 == "0" ? " " : "#")}
    }
}
