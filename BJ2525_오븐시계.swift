//
//  BJ2525_오븐시계.swift
//  Algorithm
//
//  Created by dabeen on 2021/11/17.
//

import Foundation

func solution2525_오븐시계() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let duration = Int(readLine()!)!
    
    let hour = (input[0] + (input[1]+duration)/60) % 24
    let minute = (input[1]+duration) % 60
    print("\(hour) \(minute)")
}
