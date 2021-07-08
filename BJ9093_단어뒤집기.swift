import Foundation

let T = Int(readLine()!)!

for _ in 0..<T {
    let strArr = readLine()!.split(separator: " ")
    var answer = ""
    for s in strArr {
        answer  = answer + s.reversed() + " "
    }
    
    print(answer)
}
