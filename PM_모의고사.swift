import Foundation

func solution모의고사_1(_ answers:[Int]) -> [Int] {
    var answer: [Int] = []
    let student1 = [1,2,3,4,5]
    let student2 = [2,1,2,3,2,4,2,5]
    let student3 = [3,3,1,1,2,2,4,4,5,5]
    var score = [Int](repeating: 0, count: 3)
    for i in 0..<answers.count {
        if answers[i] == student1[i%5] { score[0] += 1 }
        if answers[i] == student2[i%8] { score[1] += 1 }
        if answers[i] == student3[i%10] { score[2] += 1 }
    }
    
    for i in 0..<3 {
        if score[i] == score.max() { answer.append(i+1) }
    }
    
    return answer
}

func solution모의고사_2(_ answers:[Int]) -> [Int] {
    var answer: [Int] = []
    let student1 = [1,2,3,4,5]
    let student2 = [2,1,2,3,2,4,2,5]
    let student3 = [3,3,1,1,2,2,4,4,5,5]
    var score = [Int](repeating: 0, count: 3)
    
    for (i,v) in answers.enumerated() {
        //i: index v: value
        if v == student1[i%5] { score[0] += 1 }
        if v == student2[i%8] { score[1] += 1 }
        if v == student3[i%10] { score[2] += 1 }
    }
    
    for (i,v) in score.enumerated() {
        if v == score.max() { answer.append(i+1) }
    }

     return answer
}
