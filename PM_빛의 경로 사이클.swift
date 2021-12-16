//
//  PM_빛의 경로 사이클.swift
//  Algorithm
//
//  Created by dabeen on 2021/12/16.
//

import Foundation
//다시풀어보기
func solution_빛의_경로_사이클(_ grid:[String]) -> [Int] {

    struct Position: Equatable {
        var x:Int
        var y:Int
        var d:String
    }

    let dValue = ["up":(0,-1), "down":(0,1), "left":(-1,0), "right":(1,0)]
    let next:[String:[String:String]] = ["L":["up":"left", "down":"right", "left":"down", "right":"up"], "R":["up":"right", "down":"left", "left":"up", "right":"down"], "S":["up":"up", "down":"down", "left":"left", "right":"right"]]
    let grid = grid.map{ $0.map{ String($0) } }
    var answer:[Int] = []
    var visited = Array(repeating: Array(repeating: ["up":false, "down":false, "left":false, "right":false], count: grid[0].count), count: grid.count)
    
    
    for y in 0..<grid.count {
        for x in 0..<grid[0].count {
            for d in dValue.keys {
                let first = Position(x: x, y: y, d: d)
                var position = first
                var count = 0
                while true {
                    if visited[position.y][position.x][position.d]! { break }
                    visited[position.y][position.x][position.d] = true
                    count += 1
                    let direction = grid[position.y][position.x]
                    position.d = next[direction]![position.d]!      //다음으로 갈 방향 = 지금 가는 방향에서 다음 격자 만나면 가는 방향
                    position.x += dValue[position.d]!.0
                    position.y += dValue[position.d]!.1
                    
                    position.x = position.x < 0 ? grid[0].count - 1 : position.x % grid[0].count        //오른쪽으로 넘어가면 다시 왼쪽에서 나오기, 왼쪽으로 넘어가면 오른쪽으로 나오기
                    position.y = position.y < 0 ? grid.count - 1 : position.y % grid.count
                    if position == first && count != 0 {
                        answer.append(count)
                        break
                    }
                }
            }
        }
    }
    
    return answer.sorted()
}

