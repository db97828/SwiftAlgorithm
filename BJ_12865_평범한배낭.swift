//
//  BJ_12865.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/05.
//

import Foundation

//다시풀어보기

/*
 현재 무게 4짜리의 물품으로 테이블의 무게 7칸을 채운다면
 테이블의 무게 7짜리 칸의 가치 vs 테이블의 무게 3짜리의 칸 가지 + 현재 물품의 가치
 -> dp[i][j] = max(dp[i-1][j] , dp[i-1][j-weight[j]] + value[j])
 */

func solution12865_평범한배낭_1() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    typealias Object = (w:Int, v:Int)
    var objects = [Object]()
    
    for _ in 0..<input[0] {
        let o = readLine()!.split(separator: " ").map{Int(String($0))!}
        objects.append(Object(w:o[0], v:o[1]))
    }
    
    var dp = [[Int]](repeating: [Int](repeating: 0, count: k+1), count: n+1)
    
    for (i, (weight, value)) in objects.enumerated() {
        let item = i + 1
        
        for k in 1..<input[1]+1 {
            guard k >= weight else {
                dp[item][k] = dp[item-1][k]
                continue
            }
            dp[item][k] = max(dp[item-1][k], dp[item-1][k-weight] + value)
        }
    }
    
    print(dp.last!.last!)
}


func solution12865_평범한배낭_2() {
    //원본 dp를 temp에 복사하고, 원본과 비교해서 temp를 업데이트 시킨 후 끝나고 원본을 업데이트 시켜주면 1차원 배열로도 가능
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    typealias Object = (w:Int, v:Int)
    var objects = [Object]()
    
    for _ in 0..<input[0] {
        let o = readLine()!.split(separator: " ").map{Int(String($0))!}
        objects.append(Object(w:o[0], v:o[1]))
    }
    
    var dp = [Int](repeating: 0, count: input[1]+1)
    
    for (weight, value) in objects {
        guard weight < dp.count else { continue }
        
        var temp = dp
        for k in weight..<dp.count {
            let newValue = k-weight > 0 ? dp[k-weight] + value : value
            if dp[k] < newValue { temp[k] = newValue }
        }
        dp = temp
    }
    print(dp.last!)
}
