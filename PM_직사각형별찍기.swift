//
//  PM_직사각형별찍기.swift
//  Algorithm
//
//  Created by dabeen on 2021/09/30.
//

import Foundation

func solution_직사각형_별찍기_1() {
    let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
    let (a, b) = (n[0], n[1])

    for _ in 0..<b {
        var str = ""
        for _ in 0..<a { str += "*" }
        print(str)
    }
}

func solution_직사각형_별찍기_2() {
    let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
    let (a, b) = (n[0], n[1])

    for _ in 0..<b {
        print([String](repeating:"*",count:a).joined())
    }
}
