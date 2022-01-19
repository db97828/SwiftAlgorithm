//
//  PM_N으로표현하기.swift
//  Algorithm
//
//  Created by dabeen on 2022/01/19.
//

import Foundation

func solutio_N으로표현하기(_ N:Int, _ number:Int) -> Int {
    if N == number { return -1 }         //N이 number면 1개로 끝
    var answer = -1
    
    func dfs(_ now:Int, _ count:Int) {
        if count > 8 { return }         //8개보다 많이 사용되면 끝
        if now == number {
            if answer == -1 || count < answer { answer = count }        //number를 완성했을 때 더 작은 값이면 값 바꿔줌
            return
        }
        
        var NN = 0
        for i in 0..<8 {
            if answer != -1 && answer < count + 1 + i { break }             //최소값을 가져야 하므로 다음 갯수보다 answer이 작으면 break시켜준다
            NN = NN * 10 + N
            dfs(now + NN, count + 1 + i)
            dfs(now - NN, count + 1 + i)
            dfs(now * NN, count + 1 + i)
            dfs(now / NN, count + 1 + i)
        }
    }
    dfs(0,0)
    return answer
}
