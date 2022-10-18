//
//  Combination.swift
//  Algorithm
//
//  Created by 최다빈 on 2022/10/18.
//

import Foundation

func Combination<T>(_ element: [T], _ k: Int) -> [[T]] {
    var result: [[T]] = []
    
    func combi(_ index: Int, _ now: [T]) {
        if now.count == k {
            result.append(now)
            return
        }
        
        for i in index..<element.count {
            combi(i + 1, now + [element[i]])
        }
    }
    
    combi(0, [])
    return result
}
