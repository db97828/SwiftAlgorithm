//
//  PM_압축.swift
//  Algorithm
//
//  Created by dabeen on 2021/11/03.
//

import Foundation

func solution_압축(_ msg:String) -> [Int] {
    var dictionary = " ABCDEFGHIJKLMNOPQRSTUVWXYZ".map{String($0)}
    let msg = msg.map{String($0)}
    
    var answer = [Int]()
    
    var tempWord = ""
    for i in 0..<msg.count {
        if tempWord == "" { tempWord += msg[i] }
        else {
            if dictionary.contains(tempWord+msg[i]) { tempWord += msg[i] }
            else {
                answer.append(dictionary.firstIndex(of: tempWord)!)
                dictionary.append(tempWord+msg[i])
                tempWord = "\(msg[i])"
            }
        }
    }

    if tempWord != "" { answer.append(dictionary.firstIndex(of: tempWord)!)}
    
    return answer
}
