//
//  BJ1297_TV.swift
//  Algorithm
//
//  Created by dabeen on 2021/11/15.
//

import Foundation

func solution1297() {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))!}
    let d = Double(input[0])
    let w = Double(input[1])
    let h = Double(input[2])

    let x = sqrt(d*d/(w*w+h*h))

    print(Int(floor(x*w)), Int(floor(x*h)))
}
