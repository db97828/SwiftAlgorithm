//
//  File.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/19.
//

import Foundation

func solution_하샤드_수_1(_ x:Int) -> Bool {
    return x % String(x).map{Int(String($0))!}.reduce(0,+) == 0
}

func solution_하샤드_수_2(_ x:Int) -> Bool {
    return x % String(x).reduce(0,{$0+Int(String($1))!}) == 0
}
