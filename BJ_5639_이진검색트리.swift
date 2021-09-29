//
//  BJ_5639_이진검색트리.swift
//  Algorithm
//
//  Created by dabeen on 2021/09/29.
//

import Foundation

func solution5639_이진검색트기() {
    var preOrderList = [Int]()
    while let s = readLine(), let n = Int(s) {
        preOrderList.append(n)
    }
    postOrder(0, preOrderList.count)

    func findUpperBound(_ start:Int, _ end:Int, _ target:Int) -> Int {
        var start = start
        var end = end
        
        while start < end {
            let mid = (start + end) / 2
            
            if target < preOrderList[mid] { end = mid }
            else { start = mid + 1 }
        }
        
        return start
    }

    func postOrder(_ start:Int, _ end:Int) {
        guard start < end else { return }
        
        let uppderIndex = findUpperBound(start+1, end, preOrderList[start])
        postOrder(start+1, uppderIndex)
        postOrder(uppderIndex, end)
        print(preOrderList[start])
    }
}
