//
//  PM_실패율.swift
//  Algorithm
//
//  Created by dabeen on 2021/09/07.
//

import Foundation

func solution_실패율_2(_ N:Int, _ stages:[Int]) -> [Int] {
    var totalPlayer = [Double](repeating: 0, count: N)         //도전한 사람들
    var remainPlayer = [Int](repeating: 0, count: N+1)        //클리어 못한 사람들
    var dic = [Int:Double]()
    
    stages.forEach{
        remainPlayer[$0-1] += 1
        let last = $0 < N ? $0 : N
        for i in 0..<last {
            totalPlayer[i] += 1
        }
    }
    
    for i in totalPlayer.indices {
        dic.updateValue(remainPlayer[i] == 0 ? 0 : Double(remainPlayer[i])/totalPlayer[i], forKey: i+1)
    }
    
    return dic.sorted(by:{ $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 > $1.1}).map{$0.key}
}


func solution_실패율_1(_ N:Int, _ stages:[Int]) -> [Int] {
    var fail = [Double](repeating: 0, count: N)
    var player = [Int](repeating: 0, count: N+1)
    var dic = [Int:Double]()
    
    stages.forEach{
        player[$0-1] += 1
        let last = $0 < N ? $0 : N
        for i in 0..<last {
            fail[i] += 1
        }
    }
    
    for i in fail.indices {
//        if player[i] == 0 {
//            dic.updateValue(0, forKey: i+1)
//        } else {
//            dic.updateValue(Double(player[i])/fail[i], forKey: i+1)
//        }
        dic.updateValue(player[i] == 0 ? 0 : Double(player[i])/fail[i], forKey: i+1)
    }

//    answer = dic.sorted{$0.key < $1.key}.sorted{ $0.value > $1.value}.map{$0.key}

    return dic.sorted(by:{ $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 > $1.1}).map{$0.key}
}


func solution_실패율_3(_ N:Int, _ stages:[Int]) -> [Int] {
    var failure = [Int: Float]()
    var player = stages.count
    
    for i in 1...N {
        let n = stages.filter{$0 == i}.count
        failure[i] = Float(n)/Float(player)
        player -= n
    }

    return failure.sorted(by: <).sorted(by: { $0.value > $1.value }).map {$0.key}
}
