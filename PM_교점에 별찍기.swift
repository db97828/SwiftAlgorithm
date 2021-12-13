//
//  PM_교점에 별찍기.swift
//  Algorithm
//
//  Created by dabeen on 2021/12/13.
//

import Foundation

func solution_교점에_별_찍기(_ line:[[Int]]) -> [String] {
    var maxX = Int.min; var maxY = Int.min
    var minX = Int.max; var minY = Int.max
    var point = [(Int, Int)]()
    for i in 0..<line.count {
        for j in i+1..<line.count {
            if (line[i][0]*line[j][1] - line[i][1]*line[j][0]) != 0 {
                let x = Double((line[i][1]*line[j][2] - line[i][2]*line[j][1])) / Double((line[i][0]*line[j][1] - line[i][1]*line[j][0]))
                let y = Double((line[i][2]*line[j][0] - line[i][0]*line[j][2])) / Double((line[i][0]*line[j][1] - line[i][1]*line[j][0]))
                if x == Double(Int(x)) && y == Double(Int(y)) {
                    if !point.contains(where: { $0.0 == Int(x) && $0.1 == Int(y) }) {
                        point.append((Int(x),Int(y)))
                        maxX = max(Int(x), maxX)
                        maxY = max(Int(y), maxY)
                        minX = min(Int(x), minX)
                        minY = min(Int(y), minY)
                    }
                }
            }
        }
    }
    var answer = [[String]](repeating: [String](repeating: ".", count: maxX - minX + 1), count: maxY - minY + 1)
    for p in point {
        answer[maxY - p.1][p.0 - minX] = "*"
    }
    return answer.map{ $0.joined() }
}
