//
//  PM_다트 게임.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/19.
//

import Foundation

func solution_다트_게임_1(_ dartResult:String) -> Int {
    //이게 더 빠름
    var scores = [Int]()
    var num = ""
    dartResult.forEach{
        switch $0 {
        case "S","D","T":
            scores.append(Int(num)!)
            num = ""
            let last = scores.last!
            if $0 == "D" { scores[scores.count-1] *= last }
            else if $0 == "T" { scores[scores.count-1] *= last * last }
        case "#":
            scores[scores.count-1] *= -1
        case "*":
            scores[scores.count-1] *= 2
            if scores.count > 1 {
                scores[scores.count-2] *= 2
            }
        default:
            num += String($0)
        }
    }
    return scores.reduce(0, +)
}

func solution_다트_게임_2(_ dartResult:String) -> Int {
    let numberList = dartResult.split(whereSeparator: {$0.isLetter || $0 == "*" || $0 == "#"})
    let letterList = dartResult.split(whereSeparator: {$0.isNumber})
    
    var totalScore = 0
    
    for (index, (number, letter)) in zip(numberList, letterList).enumerated() {
        var score = 0
        if let number = Int(number) {
            score = letter.contains("D") ? number * number : letter.contains("T") ? number * number * number : number
        }
        
        if letter.contains("*") { score *= 2 }
        else if letter.contains("#") { score = -score}
        
        if index < letterList.count-1 {
            if letterList[index + 1].contains("*"){ score *= 2}
        }
        totalScore += score
    }
    
    return totalScore
}
