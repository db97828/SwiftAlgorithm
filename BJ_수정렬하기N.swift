//
//  BJ_수정렬하기N.swift
//  Algorithm
//
//  Created by dabeen on 2021/08/26.
//

import Foundation

//1과 2는 이걸로 풀림
func solution_수_정렬하기_2(){
    let N = Int(readLine()!)!
    var array = [Int]()

    for _ in 0..<N {
        array.append(Int(readLine()!)!)
    }

    array.sorted().forEach{
        print($0)
    }
}

//3은 counting sort로 풀어야함
// counting sort -> 수열의 길이보다 수의 범위가 극단적으로 크면 메모리 낭비가 심함
// -> 정렬하고자 하는 원소의 개수는 매우 많고, 수의 점위가 적을 때 사용하는 것이 좋음
// -> 하지만 swift는 입출력이 늦으므로 시간초과남 -> 빠른 입출력 해야함
func solution_수_정렬하기_3_1(){
    let N = Int(readLine()!)!
    var array = [Int](repeating: 0, count: 10001)

    for _ in 0..<N {
        array[(Int(readLine()!)!)] += 1
    }

    for i in 1..<array.count {
        for _ in 0..<array[i] {
            print(i)
        }
    }
}

//빠른 입출력 FileIO사용하기(라이브러리이므로 백준에서만 사용하기)
func solution_수_정렬하기_3_2(){
    let fIO = FileIO()

    let N = fIO.readInt()
    var array = [Int](repeating: 0, count: 10001)
    var answer = ""

    for _ in 1..<N {
        array[fIO.readInt()] += 1
    }

    for i in 1..<array.count {
        for _ in 0..<array[i] {
            answer += "\(i)\n"
        }
    }
//    print(answer)
    fIO.print(answer)
}
