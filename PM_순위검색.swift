//
//  PM_순위검색.swift
//  Algorithm
//
//  Created by dabeen on 2021/08/27.
//

import Foundation

//정확성은 다 맞고 효율성0점
func solution_순위_검색_1(_ info:[String], _ query:[String]) -> [Int] {
    let info = info.map{$0.components(separatedBy: " ").map{$0}}
    let query = query.map{$0.components(separatedBy: " ").filter{$0 != "and"}.map{$0}}
    var answer = [Int]()

    query.forEach{
        var tempInfo = info
        for i in 0..<$0.count {
            if $0[i] == "-" {continue}
            else {
                for j in (0..<tempInfo.count).reversed() {
                    if (i != $0.count-1 && $0[i] != tempInfo[j][i]) || (i == $0.count-1 && Int($0[i])! > Int(tempInfo[j][i])!){
                        tempInfo.remove(at: j)
                    }
                }
            }
        }
        answer.append(tempInfo.count)
    }
    return answer
}

//경우의 수를 모두 해놓고 해당하는 점수만 배열로 저장해 놓고 2진탐색으로 찾기... 매우 어려운문제였음...
func solution_순위_검색_2(_ info:[String], _ query:[String]) -> [Int] {
    var db: [String: [Int]] = [:]
    var answer: [Int] = []
    
    //info에서 데이터를 꺼내서 키로 만든 다음 value에 점수를 넣어서 배열로 저장
    for i in info {
        let arr = i.components(separatedBy: " ")
        let languages = [arr[0], "-"]
        let jobs = [arr[1], "-"]
        let careers = [arr[2], "-"]
        let foods = [arr[3], "-"]
        let score = Int(arr[4])!
        
        for language in languages {
            for job in jobs {
                for career in careers {
                    for food in foods {
                        let key = "\(language)\(job)\(career)\(food)"
                        if db[key] == nil {db[key] = [score]}
                        else {db[key]?.append(score)}
                    }
                }
            }
        }
    }
    
    //이진탐색을 위해 오름차순 정렬
    for i in db {
        let sortArr = i.value.sorted()
        db[i.key] = sortArr
    }
    
    //score 비교
    for i in query {
        let arr = i.components(separatedBy: " ")
        let key = "\(arr[0])\(arr[2])\(arr[4])\(arr[6])"
        let score = Int(arr[7])!
        
        if let scoreArr = db[key]{
            //이진탐색
            var left = 0
            var right = scoreArr.count - 1
            var mid = 0
            
            while left <= right {
                mid = (left + right) / 2
                if scoreArr[mid] < score { left = mid + 1}
                else { right = mid - 1 }
            }
            answer.append(scoreArr.count - left)
        } else {answer.append(0)}
    }
    
    return answer
}
