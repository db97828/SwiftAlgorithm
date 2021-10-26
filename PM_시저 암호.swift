//
//  PM_시저 암호.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/26.
//

import Foundation

func solution_시저암호_1(_ s:String, _ n:Int) -> String {
    let upperArr = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    let lowerArr = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    
    var answer = ""
    s.forEach{char in
        if char == " " { answer += String(char)}
        else if char.isLowercase { answer += String(lowerArr[(lowerArr.firstIndex(of: String(char))! + n) % 26]) }
        else if char.isUppercase { answer += String(upperArr[(upperArr.firstIndex(of: String(char))!+n ) % 26]) }
    }
    
    return answer
    
//    return s.map{ $0 == " " ? String($0) : $0.isLowercase ? lowerArr[(lowerArr.firstIndex(of: String($0))! + n) % 26] : upperArr[(upperArr.firstIndex(of: String($0))!+n ) % 26]}.joined()
    
}

func solution_시저암호_2(_ s:String, _ n:Int) -> String {
    let alpha = "abcdefghijklmnopqrstuvwxyz".map{$0}
    return String(s.map{
        guard let index = alpha.firstIndex(of: Character($0.lowercased())) else { return $0 }
        let letter = alpha[(index + n) % alpha.count]
        return $0.isUppercase ? Character(letter.uppercased()) : letter
    })
}

func solution_시저암호_3(_ s:String, _ n:Int) -> String {
    return s.utf8.map {
        var code = Int($0)
        switch code {
        case 65...90:
            code = (code + n - 65) % 26 + 65
        case 97...122:
            code = (code + n - 97) % 26 + 97
        default:
            break
        }
        return String(UnicodeScalar(code)!)
    }.joined()
}

