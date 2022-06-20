//
//  Leet406.swift
//  Algorithm
//
//  Created by dabeen on 2022/06/20.
//

import Foundation

func reconstructQueue_1(_ people: [[Int]]) -> [[Int]] {
    let people = people.sorted { lhs, rhs in
        if lhs[0] == rhs[0] {       // [0]이 큰 수로 정렬 && [0]아 같은 경우 [1]이 작은게 앞에
            return lhs[1] < rhs[1]
        }
        return lhs[0] > rhs[0]
    }
    var answer = [[Int]]()

    people.forEach { answer.insert($0, at: $0[1]) }     // [1] index에 삽입해준다

    return answer
}

func reconstructQueue_2(_ people: [[Int]]) -> [[Int]] {
    let sorted = people.sorted { lhs, rhs in
        lhs[0] == rhs[0] ? lhs[1] < rhs[1] : lhs[0] > rhs[0]
    }
    var answer = [[Int]]()
    
    for sort in sorted {        //forEach보다 for _ in 이 더 빠름
        answer.insert(sort, at: sort[1])
    }
    return answer
}
