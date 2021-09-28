//
//  PM_핸드폰번호가리기.swift
//  Algorithm
//
//  Created by dabeen on 2021/09/28.
//

import Foundation

func solution_핸드폰번호가리기_1(_ phone_number:String) -> String {
    let numbers = phone_number.map{String($0)}
    return (0..<numbers.count-4).map{ _ in "*"} + numbers[(numbers.count-4)...].joined()
}

func solution_핸드폰번호가리기_2(_ phone_number:String) -> String {
    return "\(String(repeating: "*", count: phone_number.count-4))\(phone_number.suffix(4))"
}

func solution_핸드폰번호가리기_3(_ phone_number:String) -> String {
    var answer = ""
    for (index, value) in phone_number.enumerated() {
        if index < phone_number.count-4 { answer += "*" }
        else { answer += String(value) }
    }
    return answer
}
