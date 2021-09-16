//
//  BJ_손익분기점.swift
//  Algorithm
//
//  Created by dabeen on 2021/09/16.
//

import Foundation

func solution1712_손익분기점() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let A = input[0]    //고정비용
    let B = input[1]    //가변비용
    let C = input[2]    //노트북가격

    if C-B <= 0 {print(-1)}
    else{
        var n = A / (C-B)
        while true {
            n += 1
            if A+B*n < C*n {
                print(n)
                break
            }
        }
    }
}
