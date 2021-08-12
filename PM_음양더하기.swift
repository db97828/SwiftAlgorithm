import Foundation

func solution음양더하기_1(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var answer = 0
    
    for i in 0..<absolutes.count {
        if signs[i] { answer += absolutes[i] }
        else { answer -= absolutes[i] }
    }
    
    return answer
}

func solution음양더하기_2(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    var answer = 0
    
    for i in 0..<absolutes.count {
        answer += signs[i] == true ? absolutes[i] : -absolutes[i]
    }
    
    return answer
}

func solution음양더하기_3(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    return (0..<absolutes.count).map{signs[$0] ? absolutes[$0] : -absolutes[$0]}.reduce(0, +)
}

func solution음양더하기_4(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    return zip(signs, absolutes).map{$0 ? $1 : -$1}.reduce(0,+)
}
