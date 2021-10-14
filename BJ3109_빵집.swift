//
//  BJ2109_빵집.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/14.
//

import Foundation

func solution3109_빵집() {
    let dc = [1,1,1]
    let dr = [-1,0,1]           //최대갯수를 얻기 위해서는 -1, 0, 1순서로 해야한다(위쪽부터 찾아야 더 많이 찾을 수 있음)
    var answer = 0
    
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let R = input[0]
    let C = input[1]
    var map = [[String]](repeating: [String](), count: R)
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: C), count: R)
    
    for i in 0..<R {
        map[i] = readLine()!.map{String($0)}
    }
    
    for i in 0..<R {
        answer += dfs(i,0) ? 1 : 0
    }
    
    print(answer)
    
    func dfs(_ r:Int, _ c:Int) -> Bool{
        visited[r][c] = true
        
        if c == C-1 { return true }
        
        for i in 0..<3 {
            let nr = r + dr[i]
            let nc = c + dc[i]
            
            if nr >= 0 && nr < R && nc >= 0 && nc < C {
                if !visited[nr][nc] && map[nr][nc] == "." {
                    if dfs(nr, nc) { return true }
                }
            }
        }
        return false
    }
}
