import Foundation

func solution(_ scores:[[Int]]) -> String {
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
