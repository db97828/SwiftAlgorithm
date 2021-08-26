//
//  BJ5622_다이얼.swift
//  Algorithm
//
//  Created by dabeen on 2021/08/26.
//

import Foundation

//2~9까지만 해도됨!!

func solution_다이얼_1() {
    let input = readLine()!.map{$0}
    var answer = 0

    input.forEach{
        switch $0 {
        case "A"..."C":
            answer += 3
        case "D"..."F":
            answer += 4
        case "G"..."I":
            answer += 5
        case "J"..."L":
            answer += 6
        case "M"..."O":
            answer += 7
        case "P"..."S":
            answer += 8
        case "T"..."V":
            answer += 9
        case "W"..."Z":
            answer += 10
        default :
            answer += 11
        }
    }
    print(answer)
}


func solution_다이얼_2(){
    print(readLine()!.map{$0}.map{
        switch $0 {
        case "A"..."C": return 3
        case "D"..."F": return 4
        case "G"..."I": return 5
        case "J"..."L": return 6
        case "M"..."O": return 7
        case "P"..."S": return 8
        case "T"..."V": return 9
        case "W"..."Z": return 10
        default : return 11
        }
    }.reduce(0, +))
}
