//
//  PM_위클리챌린지6주차.swift
//  Algorithm
//
//  Created by dabeen on 2021/09/09.
//

import Foundation

func solution_위클리챌린지_6주차(_ weights:[Int], _ head2head:[String]) -> [Int] {
    var dic = [Int:Boxer]()
    
    for i in weights.indices {
        let head = head2head[i].map{$0}
        let total = head.count - head.filter{$0 == "N"}.count
        let win = head.filter{$0 == "W"}.count
        let winToHeavy = weights.indices.filter{head[$0] == "W" && weights[i] < weights[$0]}.count
        dic.updateValue(Boxer(win: total != 0 ? Double(win)/Double(total) : 0, weight: weights[i], winToHeavy: winToHeavy), forKey: i+1)
    }
    
    return dic.sorted{($0.value.win == $1.value.win ?
                            ($0.value.winToHeavy == $1.value.winToHeavy ?
                                ($0.value.weight == $1.value.weight ?
                                    $0.key < $1.key :
                                    $0.value.weight > $1.value.weight) :
                                $0.value.winToHeavy > $1.value.winToHeavy) :
                            $0.value.win > $1.value.win)}
        .map{$0.key}
}

struct Boxer {
    var win: Double
    var weight: Int
    var winToHeavy: Int
}
