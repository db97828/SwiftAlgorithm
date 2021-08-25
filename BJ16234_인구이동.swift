//
//  BJ16234_인구이동.swift
//  Algorithm
//
//  Created by dabeen on 2021/08/25.
//

import Foundation

let dr = [0,0,1,-1]
let dc = [1,-1,0,0]

var map = [[Int]]()
var tempMap = [[Int]]()
var visited = [[Bool]]()
var day = 0
var N = 0
var range = 0...0

func solution_인구이동() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    N = input[0]
    range = input[1]...input[2]
    map = [[Int]](repeating: [], count: N)
    
    for i in 0..<N{
        map[i] = readLine()!.split(separator: " ").map{Int(String($0))!}
    }
    
    tempMap = map
    
    while true {
        visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
        
        for r in 0..<N {
            for c in 0..<N {
                if !visited[r][c] {
                    bfs(r,c)
                }
            }
        }
        
        if map == tempMap {break}
        else{
            day += 1
            map = tempMap
        }
    }
    
    print(day)
}

func bfs(_ r: Int, _ c: Int) {
    var queue = [Point]()
    var union = [Point]()
    queue.append(Point(r,c))
    visited[r][c] = true
    
    while !queue.isEmpty {
        let curr = queue.removeFirst()
        union.append(curr)
        
        for i in 0..<4 {
            let nr = curr.r + dr[i]
            let nc = curr.c + dc[i]
            
            if isBoundary(nr, nc) && !visited[nr][nc] {
                if range ~= abs(map[curr.r][curr.c] - map[nr][nc]) {
                    // ~= -> 범위 체크하는 연산자 ex) if 0..<10 ~= n => n이 0~10사이일 때
                    visited[nr][nc] = true
                    queue.append(Point(nr,nc))
                }
            }
        }
    }
    
    union.forEach{
        tempMap[$0.r][$0.c] = union.map{map[$0.r][$0.c]}.reduce(0, +)/union.count
    }
    
}

func isBoundary(_ r: Int, _ c: Int) -> Bool {
    return r >= 0 && r < N && c >= 0 && c < N
}

struct Point {
    var r: Int
    var c: Int
    
    init(_ r: Int, _ c: Int) {
        self.r = r
        self.c = c
    }
}
