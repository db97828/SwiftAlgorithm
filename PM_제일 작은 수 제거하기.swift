//
//  PM_제일 작은 수 제거하기.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/21.
//

import Foundation

func solution_제일_작은_수_제거하기_1(_ arr:[Int]) -> [Int] {
    //시간초과
    return arr.filter{arr.min()! < $0}.count == 0 ? [-1] : arr.filter{arr.min()! < $0}
}

func solution_제일_작은_수_제거하기_2(_ arr:[Int]) -> [Int] {
    //시간초과
    let arr = arr.filter{arr.min()! < $0}
    return arr.count == 0 ? [-1] : arr
}

func solution_제일_작은_수_제거하기_3(_ arr:[Int]) -> [Int] {
    //성공
    let min = arr.min()!
    var arr = arr
    arr.remove(at: arr.firstIndex(of: min)!)
    return arr.count == 0 ? [-1] : arr
}
