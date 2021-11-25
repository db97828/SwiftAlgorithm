//
//  PM_쿼드압축 후 개수 세기.swift
//  Algorithm
//
//  Created by dabeen on 2021/11/25.
//

import Foundation

func solution_쿼드압축_후_개수_세기_1(_ arr:[[Int]]) -> [Int] {
    var answer = [Int]()
    
    func isAllEquals(_ arr:[[Int]]) -> Bool {
        let first = arr.first!.first!
        return arr.filter{ $0.filter{ $0 != first }.count != 0 }.count == 0
    }

    func makeQuater(_ arr:[[Int]]) {
        let mid = arr.count / 2
                                                                    // r      c       r  c
        let quater1 = arr[0..<mid].map{Array($0[0..<mid])}      //(start,start)~(mid,mid)
        let quater2 = arr[0..<mid].map{Array($0[mid...])}       //(start,mid)~(mid,end)
        let quater3 = arr[mid...].map{Array($0[0..<mid])}      //(mid,start)~(end,mid)
        let quater4 = arr[mid...].map{Array($0[mid...])}       //(mid,mid)~(end,end)
        
        [quater1,quater2,quater3,quater4].forEach{ quater in
            if !isAllEquals(quater) {
                if quater.count == 2 {
                    quater.forEach{ $0.forEach{ answer.append($0) }}
                } else {
                    makeQuater(quater)
                }
            } else {
                answer.append(quater.first!.first!)
            }
        }
        
    }

    answer = []
    if !isAllEquals(arr){
        if arr.count == 2 {
            arr.forEach{ $0.forEach{ answer.append($0) }}
        } else {
            //4분할하기
            makeQuater(arr)
        }
    } else {
        answer.append(arr[0][0])
    }
    
    return [answer.filter{$0 == 0}.count, answer.filter{$0 == 1}.count]
}

func solution_쿼드압축_후_개수_세기_2(_ arr:[[Int]]) -> [Int] {
    var answer = (0,0)
    
    func DFS(_ arr:[[Int]]) {
        if !isAllEquals(arr) {
            let mid = arr.count/2
            DFS(arr[0..<mid].map{Array($0[0..<mid])})
            DFS(arr[0..<mid].map{Array($0[mid...])})
            DFS(arr[mid...].map{Array($0[0..<mid])})
            DFS(arr[mid...].map{Array($0[mid...])})
        } else {
            if arr.first!.first! == 1 { answer.1 += 1 }
            else { answer.0 += 1 }
        }
    }
    
    func isAllEquals(_ arr:[[Int]]) -> Bool {
        let target = arr.first!.first!
        return arr.filter{ $0.filter{ $0 != target}.count != 0 }.count == 0
    }
    
    DFS(arr)
    return [answer.0, answer.1]
}
