//
//  PM_행렬의곱셈.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/06.
//

import Foundation

func solution_행렬의_곱셈_1(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var answer = [[Int]]()
    
    for i in 0..<arr1.count {
        var temp = [Int]()
        for k in 0..<arr2[0].count {
            var sum = 0
            for j in 0..<arr2.count {
                sum += arr1[i][j] * arr2[j][k]
            }
            temp.append(sum)
        }
        answer.append(temp)
    }
    
    return answer
}

func solution_행렬의_곱셈_2(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    //배열 초기화 어려우면 그냥 [[Int]]()로 초기화 하기!!
    var answer = [[Int]](repeating: [Int](repeating: 0, count: arr2[0].count), count: arr1.count)
    
    for i in 0..<arr1.count {
        for k in 0..<arr2[0].count {
            for j in 0..<arr1[i].count {
                answer[i][k] += arr1[i][j] * arr2[j][k]
            }
        }
    }
    
    return answer
}
