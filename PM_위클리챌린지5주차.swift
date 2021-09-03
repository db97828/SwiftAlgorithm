//
//  PM_위클리챌린지5주차.swift
//  Algorithm
//
//  Created by dabeen on 2021/09/03.
//

import Foundation

func solution_위클리챌린지_5주차_1(_ word:String) -> Int {
    //A로 시작 -> 781개 E로 시작 -> 781개..
    let arr = ["","A","E","I","O","U"]
    var set = Set<String>()
    
    for i in arr {
        for j in arr {
            for k in arr {
                for l in arr {
                    for m in arr {
                        set.insert("\(i)\(j)\(k)\(l)\(m)")
                    }
                }
            }
        }
    }
    
    let dic = Array(set).sorted()
    
    return dic.firstIndex(of: word)!
}

func solution_위클리챌린지_5주차_2(_ word:String) -> Int {
    let arr = ["A","E","I","O","U"]
    var answer = 0
    var gap = 781
    
    for i in word {
        for j in 0..<arr.count {
            if String(i) == arr[j] {
                answer += 1 + j*gap
            }
        }
        gap = (gap-1)/5
    }
    
    return answer
}

func solution_위클리챌린지_5주차_3(_ word:String) -> Int {
    var answer = word.count
        var count = 0
        let arr = [781, 156, 31, 6, 1]
        let arr2 = ["A": 0, "E": 1, "I": 2, "O":3, "U":4]

        for ch in word{
            answer += arr2[String(ch)]!*arr[count]
            count += 1
        }
        return answer
}

func solution_위클리챌린지_5주차_4(_ word:String) -> Int {
    func dfs(_ curr: String){
        result.append(curr)
        
        if curr.count == 5 {return}
        
        for i in 0..<5 {
            dfs(curr + arr[i])
        }
    }
    
    let arr = ["A","E","I","O","U"]
    var result = [String]()
    
    dfs("")
    
    return result.firstIndex(of: word)!
}
