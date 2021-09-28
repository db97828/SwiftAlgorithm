//
//  PM_위클리챌린지8주차.swift
//  Algorithm
//
//  Created by dabeen on 2021/09/28.
//

import Foundation

func solution_위클리챌린지8주차_1(_ sizes:[[Int]]) -> Int {
    var h = 0
    var w = 0
    sizes.forEach{
        let size = $0.sorted()
        h = h > size[0] ? h : size[0]
        w = w > size[1] ? w : size[1]
    }
    return h*w
}

func solution_위클리챌린지8주차_2(_ sizes:[[Int]]) -> Int {
    var h = 0
    var w = 0
    sizes.forEach{
        h = max(h, $0.max()!)
        w = max(w, $0.min()!)
    }
    return h*w
}
