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
