//
//  PM_신규아이디추천.swift
//  Algorithm
//
//  Created by dabeen on 2021/08/30.
//

import Foundation

func solution_신규_아이디_추천(_ new_id:String) -> String {
    //1단계
    var new_id = new_id.lowercased()
    //2단계
    new_id = new_id.filter{$0.isLetter || $0.isNumber || $0 == "-" || $0 == "_" || $0 == "."}
    //3단계
    while new_id.contains("..") {
        new_id = new_id.replacingOccurrences(of: "..", with: ".")
    }
    //4단계
    if new_id.first == "." {new_id.removeFirst()}
    if new_id.last == "." {new_id.removeLast()}
    //5단계
    if new_id.isEmpty {new_id = "a"}
    //6단계
    if new_id.count >= 16 {
        new_id = String(new_id.prefix(15))
        if new_id.last == "." {new_id.removeLast()}
    }
    //7단계
    if new_id.count <= 2 {
        let last = String(new_id.last!)
        while new_id.count < 3 {
            new_id += last
        }
    }
    return new_id
}
