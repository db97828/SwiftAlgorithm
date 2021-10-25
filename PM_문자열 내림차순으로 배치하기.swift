//
//  PM_문자열 내림차순으로 배치하기.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/25.
//

import Foundation

func solutio_문자열_내림차순으로_배치하기_1(_ s:String) -> String {
    return s.map{String($0)}.sorted(by: >).joined()
}

func solutio_문자열_내림차순으로_배치하기_2(_ s:String) -> String {
    return String(s.sorted(by: >))
}
