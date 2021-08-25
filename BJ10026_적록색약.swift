//
//  BJ10026_적록색약.swift
//  Algorithm
//
//  Created by dabeen on 2021/08/24.
//

import Foundation

let dx = [0,0,1,-1]
let dy = [1,-1,0,0]
var N = 0
var mapRGB = [[String]]()
var mapRB = [[String]]()
var visited = [[Bool]]()

func solution_적록색약() {
    N = Int(readLine()!)!
    mapRGB = [[String]](repeating: [], count: N)
    mapRB = [[String]](repeating: [], count: N)
    
    for i in 0..<N {
        mapRGB[i] = readLine()!.map{(String($0))}
        mapRB[i] = readLine()!.map{String($0).replacingOccurrences(of: "G", with: "R")}
    }
    print(getCount(mapRGB), getCount(mapRB))
}

func getCount(_ map: [[String]]) -> Int {
    var answer = 0
    visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
    for x in 0..<N {
        for y in 0..<N {
            if !visited[x][y] {
                bfs(x, y, map)
                answer += 1
            }
        }
    }
    return answer
}

func bfs(_ x: Int, _ y: Int, _ map: [[String]]) {
    let color = map[x][y]
    visited[x][y] = true
    
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if isBoundary(nx, ny) && !visited[nx][ny] && color == map[nx][ny] {bfs(nx, ny, map)}
    }
}

func isBoundary(_ x: Int, _ y: Int) -> Bool {
    return x >= 0 && x < N && y >= 0 && y < N
}
