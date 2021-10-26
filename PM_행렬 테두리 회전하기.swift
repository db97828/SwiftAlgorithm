//
//  PM_행렬 테두리 회전하기.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/26.
//

import Foundation

func solution_행렬_테두리_회전하기_1(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    var map = (1...rows).map{ row in (1...columns).map{ column in (row-1)*columns + column}}
    var tempMap = map
    var answer = [Int]()
    
    queries.forEach{ query in
        let r1 = query[0]-1; let c1 = query[1]-1
        let r2 = query[2]-1; let c2 = query[3]-1
        
        map = tempMap
        var moveArr = [Int]()
        
        var r = r1
        var c = c1
        
    loop:
        while true {
            if c == c2 {
                while r <= r2 {
                    if r == r2 {
                        while c >= c1 {
                            if c == c1{
                                while r >= r1 {
                                    if r == r1 { break loop}
                                    moveArr.append(map[r][c])
                                    tempMap[r-1][c] = map[r][c]
                                    r -= 1
                                }
                            }
                            moveArr.append(map[r][c])
                            tempMap[r][c-1] = map[r][c]
                            c -= 1
                        }
                    }
                    moveArr.append(map[r][c])
                    tempMap[r+1][c] = map[r][c]
                    r += 1
                }
            }
            moveArr.append(map[r][c])
            tempMap[r][c+1] = map[r][c]
            c += 1
        }
        answer.append(moveArr.min()!)
    }
    
    return answer
}


func solution_행렬_테두리_회전하기_2(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    //네가지로 나눠서 처리해주기
    var map = (1...rows).map{ row in (1...columns).map{ column in (row-1)*columns + column}}
    var rotatedMap = map
    var answer = [Int]()
    
    queries.forEach{
        let (r1,c1,r2,c2) = ($0[0]-1, $0[1]-1, $0[2]-1, $0[3]-1)
        var minNum = Int.max
        
        //맨 윗줄
        for c in c1..<c2 {
            rotatedMap[r1][c+1] = map[r1][c]
            minNum = min(minNum, map[r1][c])
        }
        
        //오른쪽
        for r in r1..<r2 {
            rotatedMap[r+1][c2] = map[r][c2]
            minNum = min(minNum, map[r][c2])
        }
        
        //왼쪽
        for r in ((r1+1)...r2).reversed() {
            rotatedMap[r-1][c1] = map[r][c1]
            minNum = min(minNum, map[r][c1])
        }
        
        //맨 아랫줄
        for c in ((c1+1)...c2).reversed() {
            rotatedMap[r2][c-1] = map[r2][c]
            minNum = min(minNum, map[r2][c])
        }

        map = rotatedMap
        answer.append(minNum)
    }
    
    return answer
}

