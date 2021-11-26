//
//  PM_삼각달팽이.swift
//  Algorithm
//
//  Created by dabeen on 2021/11/26.
//

import Foundation

func solution_삼각_달팽이_1(_ n:Int) -> [Int] {
    let target = n*(n+1) / 2
    var front = [[Int]](repeating: [Int](), count: n)
    var back = [[Int]](repeating: [Int](), count: n)
    var start = 1
    var end = n-1
    var index = 0
    var i = 1
    var h = 1
    
    while i <= target {
        while index < end {
            if front[index].count + back[index].count <= index {
                front[index].append(i)
                i += 1
                if i > target { break }
            }
            if i > target { break }
            index += h
        }
        if index == end {
            while front[index].count + back[index].count <= index {
                front[index].append(i)
                i += 1
                if i > target { break }
            }
            if i > target { break }
            end -= 1
            h = -1
        }
        if h < 0 {
            while index > start {
                index += h
                if front[index].count + back[index].count != index {
                    back[index].append(i)
                    i += 1
                } else {
                    start = index
                }
                if i > target { break }
            }
            if i > target { break }
            start += 1
            h = 1
        }
        
    }
    
    var answer = [Int]()
    for i in 0..<n {
        answer += front[i] + back[i].reversed()
    }
    print(answer)

    return []
}
