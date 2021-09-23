//
//  BJ_1654_랜선자르기.swift
//  Algorithm
//
//  Created by dabeen on 2021/09/23.
//

import Foundation

func solution_1654_랜선자르기() -> Int {
    var answer = 0
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let K = input[0]
    let N = input[1]
    
    var lanArr = [Int]()
    for _ in 0..<K {
        lanArr.append(Int(readLine()!)!)
    }
    
    var start = 1
    var end = lanArr.max()!
    
    while start <= end {
        let mid = (start + end) / 2
        var sum = 0
        
        lanArr.forEach{
            sum += $0 / mid
        }
        
        if sum >= N {
            answer = max(mid, answer)
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    return answer
}
