//
//  PM_단속카메라.swift
//  Algorithm
//
//  Created by dabeen on 2021/12/27.
//

import Foundation

func solution_단속카메라_1(_ routes:[[Int]]) -> Int {
    var answer = 0
    var camLocation = Int.min
    let routes = routes.sorted(by: {$0.last! < $1.last! })
    for route in routes {
        if route[0] > camLocation {
            answer += 1
            camLocation = route[1]
        }
    }
    return answer
}

func solution_단속카메라_2(_ routes:[[Int]]) -> Int {
    var answer = 0
    var camLocation = Int.min
    routes.sorted(by: {$0.last! < $1.last! }).forEach{
        if $0[0] > camLocation {
            answer += 1
            camLocation = $0[1]
        }
    }
    return answer
}
