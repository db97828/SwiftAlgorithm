//
//  BJ2845_ 파티가 끝나고 난 뒤.swift
//  Algorithm
//
//  Created by dabeen on 2021/11/03.
//

import Foundation

func solution_bj2845() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let total = input[0] * input[1]
    let article = readLine()!.split(separator: " ").map{Int(String($0))!}

    print(article.map{ String($0-total) }.joined(separator: " "))
}
