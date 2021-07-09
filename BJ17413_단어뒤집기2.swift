// 시간초과
import Foundation

let str = readLine()!

var isTag = false
var splitStr = ""
var answer = ""
var strCount = 0

for s in str {
    strCount += 1
    if s == "<" {
        if splitStr != "" {
            answer += splitStr.reversed()
            splitStr = ""
        }
        isTag = true
        splitStr += "\(s)"
    } else if s == ">" {
         isTag = false
        splitStr += "\(s)"
        answer += splitStr
        splitStr = ""
    } else if s == " " {
        if isTag {
            splitStr += "\(s)"
        } else {
            answer += splitStr.reversed() + " "
            splitStr = ""
        }
    } else {
        splitStr += "\(s)"
        
        if strCount == str.count {
            answer += splitStr.reversed()
        }
    }
}

print(answer)


// 성공 -> strCount 제거, "<" 로직 수정
import Foundation

let str = readLine()!

var isTag = false
var splitStr = ""
var answer = ""

for s in str {
    if s == "<" {
        answer += splitStr.reversed()
        splitStr = ""
        isTag = true
        splitStr += "\(s)"
    } else if s == ">" {
         isTag = false
        splitStr += "\(s)"
        answer += splitStr
        splitStr = ""
    } else if s == " " {
        if isTag {
            splitStr += "\(s)"
        } else {
            answer += splitStr.reversed() + " "
            splitStr = ""
        }
    } else {
        splitStr += "\(s)"
    }
}

if splitStr != "" {
    answer += splitStr.reversed()
}

print(answer)
