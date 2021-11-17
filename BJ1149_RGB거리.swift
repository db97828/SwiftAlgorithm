//
//  BJ1149_RGB거리.swift
//  Algorithm
//
//  Created by dabeen on 2021/11/17.
//

import Foundation

func solution1149_RGB거리() {
    let n = Int(readLine()!)!
    var cost = [[Int]](repeating: [Int](repeating: 0, count: 3), count: n)

    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        if i == 0 {
            cost[i][0] = input[0]
            cost[i][1] = input[1]
            cost[i][2] = input[2]
        } else {
            cost[i][0] += input[0] + min(cost[i-1][1], cost[i-1][2])
            cost[i][1] += input[1] + min(cost[i-1][0], cost[i-1][2])
            cost[i][2] += input[2] + min(cost[i-1][0], cost[i-1][1])
        }
    }

    print(cost.last!.min()!)
}
