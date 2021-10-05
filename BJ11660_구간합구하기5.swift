//
//  BJ11660_구간합구하기5.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/05.
//

import Foundation

func solution11660_구간합구하기5() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = input[0]
    let m = input[1]
    
    var map = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: n+1)
    
    for i in 1...n {
        let line = readLine()!.split(separator: " ").map{Int(String($0))!}
        for j in 1...n {
            map[i][j] = line[j-1]
        }
    }
    
    var dp = [[Int]](repeating: [Int](repeating: 0, count: n+1), count: n+1)
    
    for i in 1...n {
        for j in 1...n {
            dp[i][j] = dp[i-1][j] + dp[i][j-1] - dp[i-1][j-1] + map[i][j]
        }
    }
    
    for _ in 0..<m {
        let points = readLine()!.split(separator: " ").map{Int(String($0))!}
        let x1 = points[0]
        let y1 = points[1]
        let x2 = points[2]
        let y2 = points[3]
        print(dp[x2][y2] - dp[x2][y1-1] - dp[x1-1][y2] + dp[x1-1][y1-1])
    }
    
}
