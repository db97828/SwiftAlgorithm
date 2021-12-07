//
//  BJ_bronz4.swift
//  Algorithm
//
//  Created by dabeen on 2021/12/07.
//

import Foundation

func solution_BJ5532_방학숙제(){
    let L = Int(readLine()!)!
    let A = Double(readLine()!)!
    let B = Double(readLine()!)!
    let C = Double(readLine()!)!
    let D = Double(readLine()!)!

    let korean = ceil(A/C)
    let math = ceil(B/D)
    print(L - max(Int(korean), Int(math)))
}

func solution_BJ5543_상근날드(){
    let buger1 = Int(readLine()!)!
    let buger2 = Int(readLine()!)!
    let buger3 = Int(readLine()!)!
    let soda1 = Int(readLine()!)!
    let soda2 = Int(readLine()!)!

    print(max(buger1, buger2, buger3) + max(soda1, soda2))
}

func solution_BJ5575_타임카드(){
    for _ in 0..<3 {
        let time = readLine()!.split(separator: " ").map{ Int($0)! }
        let durationTime = (time[3] * 3600 + time[4] * 60 + time[5]) - (time[0] * 3600 + time[1] * 60 + time[2])
        let s = durationTime % 60
        let h = durationTime / 3600
        let m = durationTime / 60 % 60
        print(h,m,s)
    }
}

func solution_BJ5596_시험점수(){
    let minkook = readLine()!.split(separator: " ").map{ Int(String($0))! }.reduce(0, +)
    let daehan = readLine()!.split(separator: " ").map{ Int(String($0))! }.reduce(0, +)
    print(max(minkook, daehan))
}
