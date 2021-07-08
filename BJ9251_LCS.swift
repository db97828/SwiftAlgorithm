//
//  BJ9251.swift
//  Algorithm
//
//  Created by dabeen on 2021/06/30.
//

import Foundation

let first = Array(readLine()!)
let second = Array(readLine()!)

var lcsTable = [[Int]](repeating: [Int](repeating: 0, count: second.count+1), count: first.count+1)


for f in 1..<first.count+1 {
    for s in 1..<second.count+1 {
        if second[s-1] == first[f-1] {
            lcsTable[f][s] = lcsTable[f-1][s-1] + 1
        } else {
            lcsTable[f][s] = max(lcsTable[f][s-1], lcsTable[f-1][s])
        }
    }
}

print(lcsTable[first.count][second.count])
