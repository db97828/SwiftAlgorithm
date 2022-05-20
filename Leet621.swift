//
//  Leet621.swift
//  Algorithm
//
//  Created by dabeen on 2022/05/19.
//

import Foundation

class Solution {
    /* 정답 참고해서 품*/
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        guard n != 0 else { return tasks.count }
        
        let charDic = tasks.reduce(into: [:]) { $0[$1, default: 0] += 1 }
        
        let maxValue = charDic.values.max() ?? 0
        let maxValueCount = charDic.filter { $0.value == maxValue }.count
        
        return max(tasks.count, (maxValue-1) * (n+1) + maxValueCount)
    }

    /* 틀림 print(leastInterval(["A","A","A","B","B","B", "C","C","C", "D", "D", "E"],2)) */
    func leastInterval_1(_ tasks: [Character], _ n: Int) -> Int {
        if n == 0 { return tasks.count }
        var tasks = tasks
        var answer: [Character] = []
        
        var checkQueue: [Character] = []    //n+1개가 되면 맨 앞에 있는 것 빼기
        
        var flag: Bool = false
        
        while !tasks.isEmpty {
            flag = false
            for i in 0..<tasks.count {
                if !checkQueue.contains(tasks[i]) {
                    answer.append(tasks[i])
                    checkQueue.append(tasks[i])
                    tasks.remove(at: i)
                    flag = true
                    break
                }
            }
            
            if !flag {
                answer.append("*")
                checkQueue.append("*")
                flag = false
            }
            
            if checkQueue.count == n+1 {
                checkQueue.removeFirst()
            }
        }
     
        return answer.count
    }

    /* 틀림 print(leastInterval(["A","A","A","B","B","B", "C","C","C", "D", "D", "E"],2)) */
    func leastInterval_2(_ tasks: [Character], _ n: Int) -> Int {
        if n == 0 { return tasks.count }
        var tasks = tasks
        var answer: [Character] = []
        
        var checkQueue: [Character] = []    //n+1개가 되면 맨 앞에 있는 것 빼기
        
        
        while !tasks.isEmpty {
            var index: Int?
            for i in 0..<tasks.count {
                if !checkQueue.contains(tasks[i]) {
                    index = i
                    if !answer.contains(tasks[i]) {
                        index = i
                    }
                }
            }
            
            if let index = index {
                answer.append(tasks[index])
                checkQueue.append(tasks[index])
                tasks.remove(at: index)
            } else {
                answer.append("*")
                checkQueue.append("*")
            }
            
            if checkQueue.count == n+1 {
                checkQueue.removeFirst()
            }
        }
     
        print(answer)
        return answer.count
    }
}
