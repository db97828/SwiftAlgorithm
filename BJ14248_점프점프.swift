//
//  BJ_점프점프.swift
//  Algorithm
//
//  Created by dabeen on 2021/12/14.
//

import Foundation

func solution_BJ14248_점프점프(){
    let dx = [1,-1]
    let num = Int(readLine()!)!
    let stones = readLine()!.split(separator: " ").map{ Int(String($0))! }
    var visited = [Bool](repeating: false, count: num)
    let index = Int(readLine()!)! - 1
    
    var answer = 0
    var queue = [Int]()

    func bfs(_ index:Int) {
        queue.append(index)
        visited[index] = true
        answer += 1
        
        while !queue.isEmpty {
            let first = queue.removeFirst()
            
            for dx in dx {
                let nextIndex = first + stones[first] * dx
                
                if nextIndex >= 0 && nextIndex < num && !visited[nextIndex] {
                    queue.append(nextIndex)
                    answer += 1
                    visited[nextIndex] = true
                }
            }
        }
    }

    bfs(index)
    print(answer)
}
