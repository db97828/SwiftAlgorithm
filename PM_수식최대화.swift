//
//  PM_수식최대화.swift
//  Algorithm
//
//  Created by dabeen on 2021/09/17.
//

import Foundation

func solution_수식최대화_1(_ expression:String) -> Int64 {
    var answer:Int64 = Int64.min
    var opPermu = [[String]]()
    
    var express = [String]()
    var op = Set<String>()
    var tempStr = ""
    expression.forEach{
        if $0.isNumber {
            tempStr += String($0)
        }else{
            express.append(tempStr)
            express.append(String($0))
            op.insert(String($0))
            tempStr = ""
        }
    }
    if !tempStr.isEmpty { express.append(tempStr) }
    
    var visited = [Bool](repeating: false, count: op.count)
    permutation(Array(op), 0, [], &visited, &opPermu)
    
    opPermu.forEach{
        answer = max(answer, calc($0, express))
    }
    
    func permutation(_ op:[String], _ current:Int, _ temp:[String], _ visited: inout [Bool], _ opPermu: inout [[String]]) {
        if current == op.count {
            opPermu.append(temp)
            return
        } else {
            for i in 0..<op.count {
                if !visited[i] {
                    visited[i] = true
                    permutation(op, current+1, temp+[op[i]], &visited, &opPermu)
                    visited[i] = false
                }
            }
        }
    }
    
    func calc(_ op:[String], _ express:[String]) -> Int64 {
        var express = express
        
        for p in op {
            while express.contains(p) {
                if let index = express.firstIndex(of: p) {
                    switch p {
                    case "+":
                        express[index-1] = String(Int64(express[index-1])! + Int64(express[index+1])!)
                    case "-":
                        express[index-1] = String(Int64(express[index-1])! - Int64(express[index+1])!)
                    default:
                        express[index-1] = String(Int64(express[index-1])! * Int64(express[index+1])!)
                    }
                    express.remove(at: index+1)
                    express.remove(at: index)
                }
            }
        }
        
        return abs(Int64(express.first!)!)
    }
    
    return answer
}


func solution_수식최대화_2(_ expression:String) -> Int64 {
    enum Operation: Character {
        case plus = "+"
        case minus = "-"
        case multiple = "*"
        
        func operate(_ n1:Int64, _ n2:Int64) -> Int64 {
            switch self {
            case .plus: return n1 + n2
            case .minus: return n1 - n2
            case .multiple: return n1 * n2
            }
        }
    }
    
    func operate(_ numbers:[Int64], _ opers:[Character], _ prior:[Operation]) -> Int64 {
        var numbers = numbers
        var opers = opers
        for oper in prior {
            while let index = opers.firstIndex(of: oper.rawValue) {
                numbers[index] = oper.operate(numbers[index], numbers[index+1])
                numbers.remove(at: index+1)
                opers.remove(at: index)
            }
        }
        return abs(numbers[0])
    }
    
    var answer:Int64 = Int64.min
    let numbers = expression.components(separatedBy: ["*","+","-"]).map{abs(Int64($0)!)}
    let opers = Array(expression.filter{!$0.isNumber})
    let allOper = "+-*"
    
    for first in allOper {
        for second in allOper {
            guard first != second else { continue }
            let third = "*+-".filter{$0 != first && $0 != second}[0]
            let result = operate(numbers, opers,
                                 [Operation(rawValue: first)!,
                                  Operation(rawValue: second)!,
                                  Operation(rawValue: third)!])
            answer = max(answer, result)
        }
    }
    
    return answer
}

