//
//  PM_스킬체크level1_2.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/22.
//

import Foundation
//입력받은 숫자만큼 "수","박" 출력하기
//ex) 3 -> "수박수"
func solution_스킬체크_Level1_2(_ n:Int) -> String {
    let str = [0:"수",1:"박"]
    return (0..<n).map{str[$0%2]!}.joined()
}
