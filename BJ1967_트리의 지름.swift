//
//  BJ1967_트리의 지름.swift
//  Algorithm
//
//  Created by dabeen on 2021/11/12.
//

import Foundation
/*
 1167번 문제와 입력만 다르게 받으면 되는 문제
 풀이 방식은 같음
 */
func solution1967_트리의_지름() {
    let n = Int(readLine()!)!
    var tree = [[(Int,Int)]](repeating: [(Int, Int)](), count: n+1)
    var visited = [Bool](repeating: false, count: n+1)
    var answer = 0
    var targetIndex = 0

    for _ in 0..<n-1 {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        tree[input[0]].append((input[1],input[2]))
        tree[input[1]].append((input[0],input[2]))
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
    visited = [Bool](repeating: false, count: n+1)
    dfs(targetIndex, 0)
    print(answer)

}
