//
//  PM_행렬의 덧셈.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/06.
//

import Foundation

func solution_행렬의_덧셈_1(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var answer = [[Int]](repeating: [Int](repeating: 0, count: arr1[0].count), count: arr1.count)
    
    for i in 0..<arr1.count {
        for j in 0..<arr1[i].count {
            answer[i][j] = arr1[i][j] + arr2[i][j]
        }
    }
    
    return answer
}

func solution_행렬의_덧셈_2(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    return zip(arr1, arr2).map{zip($0, $1).map{$0+$1}}
}

func solution_행렬의_덧셈_3(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var answer = arr1
    for i in 0..<arr2.count {
        for j in 0..<arr2[i].count {
            answer[i][j] += arr2[i][j]
        }
    }
    return answer
}
