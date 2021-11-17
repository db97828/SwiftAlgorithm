//
//  BJ2530_인공지능시계.swift
//  Algorithm
//
//  Created by dabeen on 2021/11/17.
//

import Foundation

func solution2530_인공지능시계() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let duration = Int(readLine()!)!
    let time = input[0]*3600 + input[1]*60 + input[2] + duration

    let hour = (time / 60) / 60 % 24
    let minute = (time / 60) % 60
    let sec = time % 60
    print("\(hour) \(minute) \(sec)")
}
