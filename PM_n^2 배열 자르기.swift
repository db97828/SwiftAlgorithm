//
//  PM_n^2 배열 자르기.swift
//  Algorithm
//
//  Created by dabeen on 2021/11/18.
//

import Foundation

func solution_n2_배열_자르기_1(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    //시간초과
    var firstArray = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    var secondArray:[Int] = []
    for i in 0..<n {
        for r in 0...i {
            for c in 0...i {
                if firstArray[r][c] == 0 { firstArray[r][c] = i+1 }
            }
        }
    }
    
    firstArray.forEach{
        secondArray += $0
    }
    
    return Array(secondArray[Int(left)...Int(right)])
}


func solution_n2_배열_자르기_2(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    //left~right까지만 배열 만들기
    //r,c중 큰 값 + 1을 배열에 저장
    //left의 2차배열일 때 위치 -> left/n = r left%n = c
    //right의 2차배열일 때 위치 -> right/n = r right%n = c
    var answer = [Int]()
    for i in left...right {
        let r = i / Int64(n)
        let c = i % Int64(n)
        answer.append(Int(max(r, c))+1)
    }
    return answer
}

func solution_n2_배열_자르기_3(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
    return (left...right).map{ max(Int($0)/n, Int($0)%n) + 1 }
}
