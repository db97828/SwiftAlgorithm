//
//  PM_짝수와홀수.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/21.
//

import Foundation

func solution_짝수와_홀수(_ num:Int) -> String {
    //num 범위가 정수이므로 음수도 들어올 수 있음 -> 홀수는 나머지가 1 or -1이므로 나머지가 0이면 Even 아니면 Odd로 해줌
    return num % 2 == 0 ? "Even" : "Odd"
}
