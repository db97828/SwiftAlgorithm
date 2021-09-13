//
//  NW_1번.swift
//  Algorithm
//
//  Created by dabeen on 2021/09/13.
//

import Foundation

//이런식으로풀면되지않았을까..... 예상....
func solution_NW1번() {
    getOverlabComb(n: 4,money: 4, 2, 3)

    func getOverlabComb(n:Int, money:Int, _ T:Int, _ k:Int) {
        let arr = Array(0..<n)
        var temp = [Int](repeating: 0, count: money)
        var answer = 0
        
        overlabCombination(money, &temp, 0, 0)

        print(answer)
        
        func overlabCombination(_ r:Int, _ temp: inout [Int], _ current:Int, _ start:Int) {
            if r == current {
    //            combs.append(temp)
                if isCorrect(temp, n, T, k) { answer += 1}
            }
            else{
                for i in start..<arr.count {
                    temp[current] = arr[i]
                    overlabCombination(r, &temp, current+1, i)
                }
            }
        }
    }

    func isCorrect(_ arr:[Int], _ n:Int, _ T:Int, _ k:Int) -> Bool {
        var temp = [Int](repeating: 0, count: n)
        
        for i in arr {
            temp[i] += 1
        }
        
        if temp.max()! >= k {return false}
        
        for i in 0..<temp.count-1 {
            var sum = 0
            var count = 0
            while count < T {
                sum += temp[i]
                count += 1
            }
            if sum >= k {return false}
        }
        return true
    }
}
