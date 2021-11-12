//
//  BJ1167_트리의 지름.swift
//  Algorithm
//
//  Created by dabeen on 2021/11/12.
//

import Foundation

/*
 트리의 지름을 구하는 법
 -> 한 정점(A)에서 가장 멀리 떨어진 정점(B)을 구하고,
 -> 그 정점(B)에서 가장 멀리 떨어진 정점(C)를 구하면 그 거리가 트리의 지름이다.
 */

func solution1167_트리의_지름() {
    let v = Int(readLine()!)!
    var tree = [[(Int,Int)]](repeating: [(Int, Int)](), count: v+1)
    var visited = [Bool](repeating: false, count: v+1)
    var targetIndex = 0
    var answer = 0
    
    for _ in 0..<v {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        for i in 1..<input.count-1 {
            if i % 2 == 1 { tree[input[0]].append((input[i], input[i+1])) }
        }
    }
    
    func dfs(_ index:Int, _ sum:Int) {
        visited[index] = true
        if answer < sum {
            answer = sum
            targetIndex = index
        }
        tree[index].forEach{ (index, distance) in
            if !visited[index] { dfs(index, sum + distance) }
        }
    }
    
    dfs(1, 0)
    answer = 0
    visited = [Bool](repeating: false, count: v+1)
    dfs(targetIndex, 0)
    print(answer)
}

