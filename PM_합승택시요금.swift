//
//  PM_합승택시요금.swift
//  Algorithm
//
//  Created by dabeen on 2021/08/27.
//

import Foundation

//플로이드와샬
func solution_합승_택시_요금_1(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    //n:지점갯수 s:출발점 a:집 b:집
    //s->a + s->b min 합
    var map = [[Int]](repeating: [Int](repeating: Int.max, count: n+1), count: n+1)
    for i in 1...n {map[i][i] = 0}

    fares.forEach{
        map[$0[0]][$0[1]] = $0[2]
        map[$0[1]][$0[0]] = $0[2]
    }
    
    for i in 1...n{
        for j in 1...n{
            for k in 1...n{
                if map[j][i] == Int.max || map[i][k] == Int.max {continue}
                if map[j][i] + map[i][k] < map[j][k] {
                    map[j][k] = map[j][i] + map[i][k]
                }
            }
        }
    }
    
    var answer = map[s][a] + map[s][b]
    
    for i in 1...n{
        if map[s][i] != Int.max && map[i][a] != Int.max && map[i][b] != Int.max {
            let price = map[s][i] + map[i][a] + map[i][b]
            if price < answer { answer = price}
        }
    }
    return answer
}
