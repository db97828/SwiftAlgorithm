import Foundation

func solution_괄호_변환(_ p:String) -> String {
    var answer = ""
    if p == answer { return answer }
    
    let (u,v) = divide(p)
    
    if isCorrencted(u) { return u + solution_괄호_변환(v) }
    else {
        answer += "(\(solution_괄호_변환(v)))"
        answer += u.dropFirst().dropLast().map{$0 == "(" ? ")" : "("}
    }
    
    return answer
}

func divide(_ p: String) -> (String, String) {
    let p = p.map{$0}
    var left = 0
    var right = 0
    
    for i in 0..<p.count {
        if p[i] == "(" {left += 1}
        else {right += 1}
        if left == right {
            return (String(p[...i]),String(p[Int(i+1)...]))
        }
    }
    
    return (String(p),"")
}

func isCorrencted(_ u: String) -> Bool {
    let u = u.map{$0}
    var stack = [String]()
    
    if u.first == ")" {return false}
    
    for i in u {
        if i == "(" { stack.append(String(i))}
        else {
            if stack.isEmpty {return false}
            stack.popLast()
        }
    }
    return true
}
