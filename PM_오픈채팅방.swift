import Foundation

func solution(_ record:[String]) -> [String] {
    var dic: [String : String] = [:]
    var answer: [String] = []
    var temp: [String] = []
    
    for r in record {
        let user = r.split(separator: " ")
        if user[0] == "Enter" {
            dic.updateValue(String(user[2]), forKey: String(user[1]))
            temp.append("Enter \(user[1])")
        } else if user[0] == "Leave" {
            temp.append("Leave \(user[1])")
        } else if user[0] == "Change" {
            dic.updateValue(String(user[2]), forKey: String(user[1]))
        }
    }
    
    for t in temp {
        let tempStr = t.split(separator: " ")
        if tempStr[0] == "Enter" {
            answer.append("\(dic["\(tempStr[1])"]!)님이 들어왔습니다.")
        } else {
            answer.append("\(dic["\(tempStr[1])"]!)님이 나갔습니다.")
        }
    }
    
    return answer
}

//------------------------------------------------------------------------------
// 다른 사람 풀이

import Foundation

func solution(_ record:[String]) -> [String] {
    let actions = ["Enter":"님이 들어왔습니다.", "Leave":"님이 나갔습니다."]
    var a = [String:String]()

    record.forEach {
    let separated = $0.components(separatedBy: " ")
    if separated.count > 2 {
        a[separated[1]] = separated[2]
    }
}

return record.filter { !$0.contains("Change") }.map { (value:String) -> String in
        let separated = value.components(separatedBy: " ")
        let newString = a[separated[1]]! + actions[separated[0]]!
        return newString
}
}
