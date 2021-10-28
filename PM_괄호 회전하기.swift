//
//  PM_괄호회전하기.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/28.
//

import Foundation

func solution_괄호_회전하기(_ s:String) -> Int {
    var s = s
    var answer = 0
    
    for _ in 0..<s.count {
        if isBalenced(s) { answer += 1 }
        s += String(s.removeFirst())
    }
    
    return answer
}

func isBalenced(_ s:String) -> Bool {
    let s = s.map{String($0)}
    var stack = [String]()
    
    if s[0] == "]" || s[0] == "}" || s[0] == ")" { return false }
    else {
        for i in 0..<s.count {
            if s[i] == "[" || s[i] == "{" || s[i] == "(" {
                stack.append(s[i])
            }
            else if s[i] == "]" {
                if stack.isEmpty || stack.popLast()! != "[" { return false}
            } else if s[i] == "}" {
                if stack.isEmpty || stack.popLast()! != "{" { return false}
            } else if s[i] == ")" {
                if stack.isEmpty || stack.popLast()! != "(" { return false}
            }
        }
    }
    return stack.isEmpty
}
