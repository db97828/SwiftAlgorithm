//
//  PM_큰수만들기.swift
//  Algorithm
//
//  Created by dabeen on 2021/11/04.
//

import Foundation

func solution_큰_수_만들기(_ number:String, _ k:Int) -> String {
    let number = number.map{String($0)}
    var stack = [String]()
    var count = 0
    
    for i in 0..<number.count {
        while count < k && !stack.isEmpty && stack.last! < number[i] {
            stack.removeLast()
            count += 1
        }
        if count == k {
            stack.append(contentsOf: number[i...])
            break
        } else {
            stack.append(number[i])
        }
        
    }
    return String(stack.joined().prefix(number.count-k))
}
