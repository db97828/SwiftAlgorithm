func solution(_ p:String) -> String {
    var answer = ""
    //1번
    if p.isEmpty { return answer}
    //2번
    let (u,v) = divide(p)

    if isCorrected(u) { return u + solution(v) }
    else{
        answer += "("
        answer += solution(v)
        answer += ")"
        answer += u.dropFirst().dropLast().map{ $0 == "(" ? ")" : "(" }
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
        if left == right {return (String(p[...i]), String(p[Int(i+1)...])) }
    }
    return ("","")
}

func isCorrected(_ u: String) -> Bool {
    let u = u.map{$0}
    var stack = [String]()
    if u.first == ")" {return false}

    for i in u {
        if i == "(" {stack.append(String(i))}
        else{
            if stack.isEmpty {return false}
            let _ = stack.popLast()
        }
    }

    return true
}
