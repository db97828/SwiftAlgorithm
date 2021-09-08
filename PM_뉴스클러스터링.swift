//
//  PM_뉴스클러스터링.swift
//  Algorithm
//
//  Created by dabeen on 2021/09/07.
//

import Foundation

func solution_뉴스_클러스터링_1(_ str1:String, _ str2:String) -> Int {
    let str1 = str1.map{$0.lowercased()}
    let str2 = str2.map{$0.lowercased()}
    var temp1 = [String]()
    var temp2 = [String]()
    
    for i in 0..<str1.count-1 {
        if Character(str1[i]).isLetter && Character(str1[i+1]).isLetter {
            temp1.append("\(str1[i])\(str1[i+1])")
        }
    }
    for i in 0..<str2.count-1 {
        if Character(str2[i]).isLetter && Character(str2[i+1]).isLetter {
            temp2.append("\(str2[i])\(str2[i+1])")
        }
    }
    
    var same = 0
    
    var tm1 = temp1
    var tm2 = temp2
    
    for s1 in tm1 {
        for s2 in tm2 {
            if s1 == s2 {
                same += 1
                tm1.remove(at: tm1.firstIndex(of: s1)!)
                tm2.remove(at: tm2.firstIndex(of: s2)!)
                break
            }
        }
    }
    
    return temp1.count == 0 && temp2.count == 0 ? 65536 : Int(Double(same) / Double(temp1.count + temp2.count - same) * 65536)
}
