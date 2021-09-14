//
//  PM_위클리챌린지7.swift
//  Algorithm
//
//  Created by dabeen on 2021/09/14.
//

import Foundation

func solution_위클리챌린지_7주차(_ enter:[Int], _ leave:[Int]) -> [Int] {
    var enter = enter
    var leave = leave
    var queue = [Int]()
    var answer = [Int](repeating: 0, count: enter.count)

    queue.append(enter.removeFirst())
    
    while !queue.isEmpty {
        if queue.contains(leave.first!) {
            let index = leave.removeFirst()
            queue.remove(at: queue.firstIndex(of: index)!)
            if queue.isEmpty && !enter.isEmpty {
                queue.append(enter.removeFirst())
            }
        } else {
            let count = queue.count
            queue.append(enter.removeFirst())
            queue.forEach{
                if answer[$0-1] == 0 { answer[$0-1] = count }
                else { answer[$0-1] += 1}
            }
        }
    }
    
    return answer
}
