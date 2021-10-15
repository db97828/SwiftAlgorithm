//
//  PM위클리챌린지9.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/15.
//

import Foundation

func solution_전력망을_둘로_나누기(_ n:Int, _ wires:[[Int]]) -> Int {
    var tree = [[Int]](repeating: [Int](), count: n+1)
    var visited = [Bool](repeating: false, count: n+1)
    var queue = [Int]()
    
    for wire in wires {
        tree[wire[0]].append(wire[1])
        tree[wire[1]].append(wire[0])
    }
        
    var answer = Int.max
    
    for i in 1...n {
        tree[i].forEach{
            queue.removeAll()
            visited = [Bool](repeating: false, count: n+1)
            visited[i] = true
            divideTree($0)
            answer = min(answer, abs(n-2*(n-queue.count)))
        }
    }
    
    func divideTree(_ num:Int) {
        if !visited[num] {
            queue.append(num)
            visited[num] = true
            tree[num].forEach{
                divideTree($0)
            }
        }
    }

    return answer
}
