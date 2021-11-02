//
//  PM_다음큰숫자.swift
//  Algorithm
//
//  Created by dabeen on 2021/11/02.
//

import Foundation

func solution_다음_큰_숫자_1(_ n:Int) -> Int {
    //효율성 통과못함
    func getNextNum(_ n:[String]) -> [String] {
        var numN = Int(n.joined(), radix: 2)!
        while true {
            numN += 1
            if String(numN, radix: 2).filter{ $0 == "1" }.count == n.filter{ $0 == "1" }.count { return String(numN, radix: 2).map{String($0)}}
        }
    }

    var n = String(n, radix: 2).map{String($0)}
    print(n)
    if !n.contains("0") || n.firstIndex(of: "0") == n.endIndex { n.insert("0", at: 1) }
    else { n = getNextNum(n) }
    print(n)
    return Int(n.joined(), radix: 2)!
}

func solution_다음_큰_숫자_2(_ n:Int) -> Int {
    let binaryN = String(n, radix: 2)
    let oneCnt = binaryN.filter{ $0 == "1" }.count
    var answer = n+1
    
    while true {
        if String(answer, radix: 2).filter{ $0 == "1" }.count == oneCnt { break }
        answer += 1
    }
    return answer
}

func solution_다음_큰_숫자_3(_ n:Int) -> Int {
    //nonzeroBitCount!!!! 알아두기!!!
    var answer = n+1
    
    while true {
        if n.nonzeroBitCount == answer.nonzeroBitCount { break }
        answer += 1
    }
    return answer
}
