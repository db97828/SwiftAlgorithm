//
//  PM_위클리챌린지4주차.swift
//  Algorithm
//
//  Created by dabeen on 2021/08/27.
//

import Foundation

func solution_위클리챌린지_4주차_1(_ table:[String], _ languages:[String], _ preference:[Int]) -> String {
    let table = table.map{$0.split(separator: " ").map{$0}}
    var scoreArr = [Int]()

    for i in 0..<table.count {
        var score = 0
        for lagnIndex in 0..<languages.count {
            for j in 1..<table[i].count {
                if table[i][j] == languages[lagnIndex] {
                    score += (6-j) * preference[lagnIndex]
                    break
                }
            }
        }
        scoreArr.append(score)
    }
    var tempArr = [String]()
    
    for i in 0..<scoreArr.count {
        if scoreArr[i] == scoreArr.max() {
            tempArr.append(String(table[i][0]))
        }
    }
    
    return tempArr.sorted().first!
}


func solution_위클리챌린지_4주차_2(_ table:[String], _ languages:[String], _ preference:[Int]) -> String {
    var langDic = Dictionary<String,Int>()
    var max = -1
    var answer = ""
    
    for i in 0..<languages.count {
        langDic["\(languages[i])"] = preference[i]
    }
    
    for i in table {
        let arr = i.components(separatedBy: " ")
        var sum = 0
        for j in 1..<arr.count {
            if langDic["\(arr[j])"] != nil {
                sum += langDic["\(arr[j])"]!*(6-j)
            }
        }
        if sum > max || (sum == max && answer > arr[0]){
            answer = arr[0]
            max = sum
        }
    }
    
    return answer
}

//코드수는 줄일 수 있지만 시간이 더 오래걸림
func solution_위클리챌린지_4주차_3(_ table:[String], _ languages:[String], _ preference:[Int]) -> String {
    var langDic = Dictionary<String,Int>()
    var max = -1
    var answer = ""
    
    for i in 0..<languages.count {
        langDic["\(languages[i])"] = preference[i]
    }
    
    for i in table {
        let arr = i.components(separatedBy: " ")
        let sum = (1..<arr.count).filter{langDic["\(arr[$0])"] != nil}.map{langDic["\(arr[$0])"]!*(6-$0)}.reduce(0, +)
        if sum > max || (sum == max && answer > arr[0]){
            answer = arr[0]
            max = sum
        }
    }
    
    return answer
}
