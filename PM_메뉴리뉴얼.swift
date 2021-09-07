//
//  PM_메뉴리뉴얼.swift
//  Algorithm
//
//  Created by dabeen on 2021/09/07.
//

import Foundation

var dic = [String:Int]()

func solution_메뉴_리뉴얼(_ orders:[String], _ course:[Int]) -> [String] {
    var answer = [String]()
    
    for num in course {
        dic = [:]
        for order in orders {
            combination(order.map{String($0)}.sorted(), num, 0, "")
        }
        answer += dic.filter{$0.value >= 2}.filter{$0.value == dic.values.max()}.map{$0.key}
    }
    
    return answer
}

func combination(_ target: [String], _ targetNum: Int, _ index: Int, _ temp: String) {
    if temp.count == targetNum {
        dic.updateValue((dic[temp] ?? 0)+1, forKey: temp)
        return
    }
    
    for i in index..<target.count {
        combination(target, targetNum, i+1, temp+target[i])
    }
}
