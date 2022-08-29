//
//  Leet1576.swift
//  Algorithm
//
//  Created by dabeen on 2022/08/29.
//

import Foundation

class Solution_1576 {
    func modifyString_1(_ s: String) -> String {
        if s == "?" { return "a" }
        let alphabet = "abcdefghijflmnopqrstuvwxyz"
        var s = s.map { String($0) }
        
        for index in 0..<s.count {
            if s[index] == "?" {
                if index == 0 {
                    s[index] = String(alphabet.replacingOccurrences(of: s[index+1], with: "").first!)
                } else if index == s.count-1 {
                    s[index] = String(alphabet.replacingOccurrences(of: s[index-1], with: "").first!)
                } else {
                    var tempAlpha = alphabet.replacingOccurrences(of: s[index+1], with: "")
                    tempAlpha = tempAlpha.replacingOccurrences(of: s[index-1], with: "")
                    s[index] = String(tempAlpha.first!)
                }
            }
        }
        return s.joined()
    }

    func modifyString_2(_ s: String) -> String {
        if s == "?" { return "a" }
        
        var chars: [Character] = s.map { $0 }
        let alphabet: [Character] = "abcdefghijklmnopqrstuvwxyz".map { $0 }
        var index: Int = 0
        
        while index < chars.count-1 {
            if index == 0 {
                if chars[index] == "?" {
                    for ch in alphabet where chars[index+1] != ch {
                        chars[index] = ch
                        break
                    }
                }
                index += 1
                continue
            }
            if chars[index] == "?" {
                for ch in alphabet where chars[index+1] != ch && chars[index-1] != ch {
                    chars[index] = ch
                    break
                }
            }
            index += 1
        }
        
        if index == chars.count-1 {
            if chars[index] == "?" {
                for ch in alphabet where chars[index-1] != ch {
                    chars[index] = ch
                    break
                }
            }
        }
        
        return String(chars)
    }
}
