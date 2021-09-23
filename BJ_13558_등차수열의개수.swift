//
//  BJ_13558.swift
//  Algorithm
//
//  Created by dabeen on 2021/09/23.
//

import Foundation

//시간초과
func solution_13558_등차수열의_개수_1() -> Int {
    let n = Int(readLine()!)!
    let array = readLine()!.split(separator: " ").map{Int(String($0))!}

    var temp = Set<String>()

    for i in 0..<n {
        for j in Int(i+1)..<n {
            for k in Int(j+1)..<n {
                if array[j] - array[i] == array[k] - array[j] { temp.insert("\(i)\(j)\(k)") }
            }
        }
    }
    return temp.count
}

//func solution_13558_등차수열의_개수_2() -> Int {
//    let n = Int(readLine()!)!
//    let array = readLine()!.split(separator: " ").map{Int(String($0))!}
//
//    var temp = Set<String>()
//
//    for i in 0..<n {
//        for j in Int(i+1)..<n {
//            for k in Int(j+1)..<n {
//                if array[j] - array[i] == array[k] - array[j] { temp.insert("\(i)\(j)\(k)") }
//            }
//        }
//    }
//    return temp.count
//}
