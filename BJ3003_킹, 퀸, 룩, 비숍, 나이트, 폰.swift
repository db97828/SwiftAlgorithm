//
//  BJ3003_킹, 퀸, 룩, 비숍, 나이트, 폰.swift
//  Algorithm
//
//  Created by dabeen on 2021/11/03.
//

import Foundation

func solution3003() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    print(zip([1,1,2,2,2,8], input).map{ String($0 - $1)}.joined(separator: " "))
}
