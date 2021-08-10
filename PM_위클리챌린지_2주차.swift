import Foundation

func solution위클리챌린지_2주차_1(_ scores:[[Int]]) -> String {
    var answer = ""
    
    for j in 0..<scores.count {
        var tempArray: [Int] = []
        var tempDic: [Int:Int] = [:]
        
        for i in 0..<scores[j].count {
            tempArray.append(scores[i][j])
            tempDic.updateValue((tempDic[scores[i][j]] ?? 0)+1, forKey: scores[i][j])
        }
        
        if tempArray.max() == tempArray[j] || tempArray.min() == tempArray[j] {
            if tempDic[tempArray[j]] == 1 {
                tempArray.remove(at: j)
            }
        }
        answer.append(getGrade(tempArray))
    }
    
    return answer
}

func getGrade(_ score: [Int]) -> String {
    let score = score.reduce(0,+) / score.count
    if score >= 90 { return "A" }
    else if score >= 80 { return "B" }
    else if score >= 70 { return "C" }
    else if score >= 50 { return "D" }
    else { return "F" }
}


//-> 다른 사람 풀이

func solution위클리챌린지_2주차_2(_ scores:[[Int]]) -> String {
    let n = scores.count        //미리 저장해서 사용
    var score: [Int] = []
    var avg: Float = 0
    var answer = ""
    
    for i in 0..<n {
        //내 점수 미리 저장
        let myPoint = scores[i][i]
        score = []
        for j in 0..<n {
            if i != j {
                //내 점수 빼고 배열에 저장
                score.append(scores[j][i])
            }
        }
        
        if myPoint > score.max()! || myPoint < score.min()! {
            //내 점수가 배열에 저장 한 점수들보다 크거나, 작으면 (최대or최소 이면서 유일한 경우)
            avg = Float(score.reduce(0, +)) / Float(n-1)
        } else {
            avg = Float(myPoint + score.reduce(0, +)) / Float(n)
        }
        
        if avg >= 90 { answer += "A" }
        else if avg >= 80 { answer += "B" }
        else if avg >= 70 { answer += "C" }
        else if avg >= 50 { answer += "D" }
        else { answer += "F" }
    }
    
    return answer
}

