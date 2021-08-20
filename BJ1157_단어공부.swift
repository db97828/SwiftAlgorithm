//
//  BJ1157_단어공부.swift
//  Algorithm
//
//  Created by dabeen on 2021/08/20.
//

import Foundation

func solution단어공부() {
    let str = readLine()!.map{$0.uppercased()}
    var dic: [String:Int] = [:]

    str.forEach{
        dic.updateValue(dic[$0, default: 0] + 1, forKey: $0)
    }

    let sortedDic = dic.sorted{$0.value > $1.value}
    print(sortedDic.filter{$0.value == sortedDic.first!.value}.count > 1 ? "?" : sortedDic.first!.key)
}
