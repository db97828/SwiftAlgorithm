//
//  PM_땅따먹기.swift
//  Algorithm
//
//  Created by dabeen on 2021/11/17.
//

import Foundation

//DP문제
// -> 바로 위에 있는 것 제외하고 가장 큰 수 더해주면서 마지막열에서 가장 큰 값 리턴
func solution_땅따먹기(_ land:[[Int]]) -> Int{
    var newLand = land
    
    for i in 1..<newLand.count {
        newLand[i][0] += max(newLand[i-1][1], newLand[i-1][2], newLand[i-1][3])
        newLand[i][1] += max(newLand[i-1][0], newLand[i-1][2], newLand[i-1][3])
        newLand[i][2] += max(newLand[i-1][0], newLand[i-1][1], newLand[i-1][3])
        newLand[i][3] += max(newLand[i-1][0], newLand[i-1][1], newLand[i-1][2])
    }
    
    return newLand.last!.max()!
}
