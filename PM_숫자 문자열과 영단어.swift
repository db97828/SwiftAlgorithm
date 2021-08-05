import Foundation

func solution문자열과_영단어(_ s:String) -> Int {
   let s = s.map{ String($0) }
   var answer = ""
   var jump = 0

   for i in 0..<s.count {
       if jump == 0 {
           switch s[i] {
           case "z":
               answer += "0"
               jump = 3
           case "o":
               answer += "1"
               jump = 2
           case "t":
               if s[i+1] == "w" {
                   answer += "2"
                   jump = 2
               } else {
                   answer += "3"
                   jump = 4
               }
           case "f":
               if s[i+1] == "o" {
                   answer += "4"
               } else {
                   answer += "5"
               }
               jump = 3
           case "s":
               if s[i+1] == "i" {
                   answer += "6"
                   jump = 2
               } else {
                   answer += "7"
                   jump = 4
               }
           case "e":
               answer += "8"
               jump = 4
           case "n":
               answer += "9"
               jump = 3
           default:
               answer += s[i]
           }
       } else {
           jump -= 1
       }
   }

   return Int(answer)!
}

func solution문자열과_영단어(_ s:String) -> Int {
   let s = s

   let answer = s.replacingOccurrences(of: "zero", with: "0")
       .replacingOccurrences(of: "one", with: "1")
       .replacingOccurrences(of: "two", with: "2")
       .replacingOccurrences(of: "three", with: "3")
       .replacingOccurrences(of: "four", with: "4")
       .replacingOccurrences(of: "five", with: "5")
       .replacingOccurrences(of: "six", with: "6")
       .replacingOccurrences(of: "seven", with: "7")
       .replacingOccurrences(of: "eight", with: "8")
       .replacingOccurrences(of: "nine", with: "9")

   return Int(answer)!
}


func solution문자열과_영단어(_ s:String) -> Int {
    let number = ["zero" : "0", "one" : "1", "two" : "2", "three" : "3", "four" : "4", "five" : "5", "six" : "6", "seven" : "7", "eight" : "8", "nine" : "9"]
    var s = s
    
    for n in number {
        s = s.replacingOccurrences(of: n.key, with: n.value)
    }
    
    return Int(s)!
}
