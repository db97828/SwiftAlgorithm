//
//  PM_나머지가 1이 되는 수 찾기.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/20.
//

import Foundation

func solution_나머지가_1이_되는_수_찾기_1(_ n:Int) -> Int {
    return (1...n).filter{n % $0 == 1}.min()!
}

func solution_나머지가_1이_되는_수_찾기_2(_ n:Int) -> Int {
    //1번보다 훨~씬 빠름
    for x in 1...n {
        if n % x == 1 { return x }
    }
    return 0
}

func solution_나머지가_1이_되는_수_찾기_3(_ n:Int) -> Int {
    var x = 1
    while n % n != 1 {
        x += 1
    }
    return x
}
