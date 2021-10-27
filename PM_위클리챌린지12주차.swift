//
//  PM_위클리챌린지12주차.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/27.
//

import Foundation

//dfs로도 풀어보기
func solution_위클리챌린지_12주차(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var answer = Int.min

    func permu(_ k:Int ,_ dungeons:[[Int]], _ n:Int) {
        if n == 0 {
            answer = max(answer, getCount(k, dungeons))
        } else {
            var dungeons = dungeons
            permu(k,dungeons, n-1)
            for i in 0..<n {
                dungeons.swapAt(i, n)
                permu(k,dungeons, n-1)
                dungeons.swapAt(i, n)
            }
        }
    }

    func getCount(_ k:Int, _ dungeons:[[Int]]) -> Int {
        var count = 0
        var k = k
        dungeons.forEach{
            let (required, consumed) = ($0[0], $0[1])
            if k >= required {
                k -= consumed
                count += 1
            } else { return }
        }
        return count
    }
    
    permu(k,dungeons, dungeons.count-1)
    
    return answer
}

