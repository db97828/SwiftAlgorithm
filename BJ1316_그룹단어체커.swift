//
//  BJ1316_그룹단어체커.swift
//  Algorithm
//
//  Created by dabeen on 2021/08/26.
//

import Foundation

func solution_그룹단어체커_1() {
    let n = Int(readLine()!)!
    var answer = 0

    for _ in 0..<n {
        getCount()
    }
    print(answer)

    func getCount() {
        let input = readLine()!.map{$0}
        if input.count <= 2 {answer += 1}
        else{
            for i in 0..<input.count {
                for j in i+1..<input.count {
                    if j != i+1 && input[i] == input[j] {return}
                    else if input[i] == input[j] {break}
                    else if input[i] != input[j] {continue}
                }
            }
            answer += 1
        }
    }
}

func solution_그룹단어체커_2(){
    let n = Int(readLine()!)!
    var answer = 0
    
    for _ in 0..<n {
        var check = [Character]()
        let word = readLine()!
        
        for char in word {
            if !check.contains(char){check.append(char)}
            else{
                if check.last != char {
                    check.removeAll()
                    break
                }
            }
        }
        if check.count != 0 {answer += 1}
    }
    
    print(answer)
}
