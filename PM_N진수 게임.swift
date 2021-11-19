//
//  PM_N진수 게임.swift
//  Algorithm
//
//  Created by dabeen on 2021/11/19.
//

import Foundation

func solution_N진수_게임(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var numberArr = [String]()
    var number = 0
    while numberArr.count <= t*m {
        numberArr += String(number, radix: n).map{String($0)}
        number += 1
    }
    return numberArr.enumerated().filter{ $0.offset % m == p-1 }.map{$0.element.uppercased()}[..<t].joined()
}
