//
//  PM_2개 이하로 다른 비트.swift
//  Algorithm
//
//  Created by dabeen on 2021/11/18.
//

import Foundation

func solution_2개_이하로_다른_비트_1(_ numbers:[Int64]) -> [Int64] {
    //10,11번 시간초과
    func getNextNumber(_ number:Int64) -> Int64 {
        var target = number + 1
        while true {
            var numBinary = String(number, radix: 2)
            let targetBinary = String(target, radix: 2)
            numBinary = repeatElement("0", count: targetBinary.count - numBinary.count) + numBinary
            if zip(numBinary, targetBinary).filter({ $0 != $1 }).count <= 2 {
                return target
            } else {
                target += 1
            }
        }
    }

    var answer = [Int64]()
    for number in numbers {
        answer.append(getNextNumber(number))
    }
    return answer
}

func solution_2개_이하로_다른_비트_2(_ numbers:[Int64]) -> [Int64] {
    //짝수 -> 마지막이 항상 0 -> 이것만 1로 바꿔줌 -> +1해주기
    //홀수 -> 마지막 0을 1로 바꾸고, 그 뒤를 0으로 바꿈
    //      (만약 모두 1인 경우 맨 앞을 0으로 바꾸고 그 앞에 1추가하기)
    var answer = [Int64]()
    for number in numbers {
        if number % 2 == 0 {
            answer.append(number+1)
        } else {
            var numBinary = ["0"] + String(number, radix: 2).map{String($0)}
            for i in 0..<numBinary.count {
                if numBinary[numBinary.count - (i+1)] == "0" {
                    numBinary[numBinary.count - (i+1)] = "1"
                    if i != 0 {
                        numBinary[numBinary.count - i] = "0"
                    }
                    answer.append(Int64(numBinary.joined(), radix: 2)!)
                    break
                }
            }
        }
    }
    return answer
}

func solution_2개_이하로_다른_비트_3(_ numbers:[Int64]) -> [Int64] {
    //비트연산 사용하기... 공부 더 하기...
    //참고 [https://turume.tistory.com/entry/%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%A8%B8%EC%8A%A4-2%EA%B0%9C-%EC%9D%B4%ED%95%98%EB%A1%9C-%EB%8B%A4%EB%A5%B8-%EB%B9%84%ED%8A%B8-Swift]
    return numbers.map {
        if $0 % 2 == 0 { return $0 + 1 }    //짝수인 경우 마지막이 0 이므로 그것만 1로 바꾸기 -> 1더하기
        else {
            let last = (~$0) & ($0+1)       //제일 뒤에 있는 0 찾기 원래수에서 +1 한 것과 원래수에 not연산 한 것을 &연산 하면 1이 위치한 곳이 0이 있던 자리이다
            return ($0 | last) & ~(last>>1)     //last에서 shift연산을 하면 바로 옆의 1의 위치를 얻을 수 있다
                                                //현재 숫자와 0의 위치를 |연산 하고, 이를 또 1의 위치와 &연산 하면 답을 구할 수 있음
        }
    }
}


func solution_2개_이하로_다른_비트_4(_ numbers:[Int64]) -> [Int64] {
    //비트연산 사용하기... 공부 더 하기...
    func f(_ number: Int64) -> Int64 {
        return (number | ~number & (number + 1)) & ~((~number & (number + 1)) >> 1)
    }
    
    return numbers.map(f)
}
