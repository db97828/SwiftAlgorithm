//
//  PM_가운데글자가져오기.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/20.
//

import Foundation

func solution_가운데_글자_가져오기_1(_ s:String) -> String {
    let s = s.map{String($0)}
    return s.count % 2 == 0 ? "\(s[s.count/2])\(s[s.count/2+1])" : "\(s[s.count/2])"
}
