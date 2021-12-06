//
//  PM_프랜즈 4블록.swift
//  Algorithm
//
//  Created by dabeen on 2021/12/06.
//

import Foundation
//다시풀어보기
func solution_프렌즈_4블록(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var answer = 0
    var boards = board.map{ $0.map{ String($0) } }
    
    while true {
        var flag = false
        var flagBoard = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
        
        for i in 1..<m {
            for j in 1..<n {
                let target = boards[i][j]
                if target != " " && target == boards[i][j-1] && target == boards[i-1][j] && target == boards[i-1][j-1] {
                    flag = true
                    flagBoard[i][j] = true
                    flagBoard[i-1][j] = true
                    flagBoard[i][j-1] = true
                    flagBoard[i-1][j-1] = true
                }
            }
        }
        
        if !flag { break }
        
        for i in 0..<m {
            for j in 0..<n {
                if flagBoard[i][j] {
                    answer += 1
                    for k in stride(from: i, through: 1, by: -1) {
                        boards[k][j] = boards[k-1][j]
                        boards[k-1][j] = " "
                    }
                }
            }
        }
    }
    
    return answer
}
