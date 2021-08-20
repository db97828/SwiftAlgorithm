//
//  BJ10809_알파벳찾기.swift
//  Algorithm
//
//  Created by dabeen on 2021/08/20.
//

import Foundation

func solution알파벳찾기(){
    let S = readLine()!

    for i in 97..<123 {
        var index = -1
        if let target = S.firstIndex(of: Character(UnicodeScalar(i)!)) {
            index = S.distance(from: S.startIndex, to: target)
        }
        print(index, terminator: " ")
    }
}
