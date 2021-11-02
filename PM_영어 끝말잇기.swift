//
//  PM_끝말잇기.swift
//  Algorithm
//
//  Created by dabeen on 2021/11/02.
//

import Foundation

func solution_영어_끝말잇기_1(_ n:Int, _ words:[String]) -> [Int] {
    var countArr = [Int](repeating: 0, count: n)
    var usedWords = [String]()
    
    for i in 0..<words.count {
        countArr[i%n] += 1
        if i != 0 {
            if words[i-1].last != words[i].first || usedWords.contains(words[i]) {
                //출력하기
                return [i%n + 1, countArr[i%n]]
            }
        }
        usedWords.append(words[i])
    }
    
    return [0,0]
}

func solution_영어_끝말잇기_2(_ n:Int, _ words:[String]) -> [Int] {
    for i in 1..<words.count {
        print(words[i-1][words[i-1].index(words[i-1].endIndex, offsetBy: -1)])
        print(words[i][words[i].index(words[i].startIndex, offsetBy: 0)])
        print(words[0..<i])
        
        if (words[i-1][words[i-1].index(words[i-1].endIndex, offsetBy: -1)] != words[i][words[i].index(words[i].startIndex, offsetBy: 0)]) || (words[0..<i].contains(words[i])) {
            return [((i+1) % n == 0 ? n : (i+1) % n), Int(i/n)+1]
        }
    }
    return [0,0]
}
