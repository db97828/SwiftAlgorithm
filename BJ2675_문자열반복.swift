//
//  BJ2675_문자열반복.swift
//  Algorithm
//
//  Created by dabeen on 2021/08/20.
//

import Foundation

func solution문자열반복() {
    let n = Int(readLine()!)!

    for _ in 0..<n {
        var answer = ""
        let input = readLine()!.split(separator: " ").map{String($0)}
        let num = Int(input[0])!
        
        let _ = input[1].map{char in(0..<num).map{_ in answer += String(char)}}
        
        print(answer)
    }
}
