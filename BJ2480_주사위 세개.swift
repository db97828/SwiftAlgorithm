//
//  BJ2480_주사위 세개.swift
//  Algorithm
//
//  Created by dabeen on 2021/11/17.
//

import Foundation

func solution2480_주사위세개() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: >)
    
    if input[0] == input[1] {
        if input[1] == input[2] {
            print(input[0] * 1000 + 10000)
        } else {
            print(input[0] * 100 + 1000)
        }
    } else if input[1] == input[2] {
        print(input[1] * 100 + 1000)
    } else {
        print(input[0]*100)
    }
}
