//
//  PM_배달.swift
//  Algorithm
//
//  Created by dabeen on 2021/11/01.
//

import Foundation


func solution_배달_1(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    //15,20,21,22,23,24,27,28,29,32 실패
    var map = [[Int]]()
    var answer = Set<Int>()
    var visited = [Bool]()
    
    map = [[Int]](repeating: [Int](repeating: Int.max, count: N+1), count: N+1)
    visited = [Bool](repeating: false, count: N+1)
    answer = []
    road.forEach{
        map[$0[0]][$0[1]] = min(map[$0[0]][$0[1]],$0[2])
        map[$0[1]][$0[0]] = min(map[$0[0]][$0[1]],$0[2])
    }
    
    answer.insert(1)
    visited[1] = true
    
    for i in 1...N {
        if map[1][i] != Int.max && map[1][i] <= k {
            visited[i] = true
            answer.insert(i)
            search(i, k, map[1][i])
        }
    }
    
    func search(_ i:Int, _ k:Int, _ total:Int) {
        for j in 1...map.count-1 {
            if !visited[j] && map[i][j] != Int.max && map[i][j]+total <= k {
                visited[j] = true
                answer.insert(j)
                search(j, k, map[i][j]+total)
            }
        }
    }

    return answer.count
}

func solution_배달_2(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var map = [Int](repeating: Int.max, count: N+1)
    map[1] = 0
    var queue = [1]
    while !queue.isEmpty {
        let first = queue.removeFirst()
        let filterNodes = road.filter{ $0[0] == first || $0[1] == first}
        
        for node in filterNodes {
            let otherNode = node[0] == first ? node[1] : node[0]
            if map[first] == Int.max { continue }
            if map[first] + node[2] < map[otherNode] {
                map[otherNode] =    map[first] + node[2]
                queue.append(otherNode)
            }
        }
    }
    
    return map.filter{$0 <= k}.count
}
