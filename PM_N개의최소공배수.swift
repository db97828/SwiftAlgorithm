//
//  PM_N개의최소공배수.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/01.
//

import Foundation

//0번째 1번째의 최소공배수 구하기 -> 그 최소공배수와 2번째의 최소공배수 구하기 .... 마지막까지 진행
//1은 모든 수의 최소공배수가 될 수 있으므로 맨 처음은 1과 비교

func solution_N개의_최소공배수(_ arr:[Int]) -> Int {
    return arr.reduce(1){lcm($0, $1)}
}

func lcm(_ a:Int, _ b:Int) -> Int {
    return a * b / gcd(a, b)
}

func gcd(_ a:Int, _ b:Int) -> Int {
    if a % b == 0 { return b }
    else { return gcd(b, a % b)}
}
