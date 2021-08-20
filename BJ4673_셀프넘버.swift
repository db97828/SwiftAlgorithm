//
//  BJ4673_셀프넘버.swift
//  Algorithm
//
//  Created by dabeen on 2021/08/20.
//

import Foundation

func solution_셀프넘버() {
    var array: [Int] = []

    for i in 1...10000 {
        let numArray = String(i).map{$0}
        array.append(i + numArray.map{Int(String($0))!}.reduce(0, +))
        if !array.contains(i) {print(i)}
    }
}
