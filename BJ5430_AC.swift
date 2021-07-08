import Foundation

// 1. 시간초과
let T = Int(readLine()!)!       //테스트케이스 갯수

for _ in 0..<T {
    let pArr = Array(readLine()!)
    let _ = readLine()!
    var numbers = readLine()!.replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "").components(separatedBy: ",")
    
    var dCount = 0
    
    for p in pArr {
        if p == "D" {
            dCount = dCount + 1
            if dCount > numbers.count || numbers.first == "" {
                print("error")
                break
            } else {
                numbers.removeFirst()
            }
        } else if p == "R" {
            numbers = numbers.reversed()
        }
    }
    
    if !numbers.isEmpty && numbers.first != ""{
        print(numbers)
    }
}

// 2. 시간초과(reversed() 제거)
let T = Int(readLine()!)!       //테스트케이스 갯수

for _ in 0..<T {
    let pArr = Array(readLine()!)
    let _ = readLine()!
    var numbers = readLine()!.replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "").components(separatedBy: ",")
    
    var dCount = 0
    var reversed = false
    
    for p in pArr {
        if p == "D" {
            dCount = dCount + 1
            if dCount > numbers.count || numbers.first == "" {
                print("error")
                break
            } else {
                if reversed {
                    numbers.removeLast()
                } else {
                    numbers.removeFirst()
                }
            }
        } else if p == "R" {
            reversed = !reversed
        }
    }
    
    if !numbers.isEmpty && numbers.first != ""{
        print(numbers)
    }
}

// 3. 시간초과(함수로 빼서 계산)

 let T = Int(readLine()!)!       //테스트케이스 갯수
 var numbers: [String] = []
 var reversed: Bool = false

 for _ in 0..<T {
     let pArr = Array(readLine()!)
     let _ = readLine()!
     numbers = readLine()!.replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "").components(separatedBy: ",")

     print(getAnswer(pArr: pArr))
 }

 func getAnswer(pArr:[String.Element]) -> String {
     for p in pArr {
         if p == "D" {
             if numbers.isEmpty || numbers.first == "" {
                 return "error"
             } else {
                 if reversed {
                     numbers.removeLast()
                 } else {
                     numbers.removeFirst()
                 }
             }
         } else if p == "R" {
             reversed = !reversed
         }
     }
     return "\(numbers)"
 }

// 4. 성공(remove, reverse를 안해주고 범위만 옮긴 후 마지막에 reverse)

let T = Int(readLine()!)!       //테스트케이스 갯수

for _ in 0..<T {
    let pArr = Array(readLine()!)       //수행 할 함수
    let _ = readLine()!                 //배열에 들어있는 수 개수
    let numbers = readLine()!.dropFirst().dropLast().split(separator: ",").map{ String($0) }
    var startIndex = 0
    var endIndex = numbers.count
    var error = false
    var reversed = false
    var dCount = 0

    for p in pArr {
        if p == "R"{
            reversed = !reversed
        } else {
            dCount += 1
            if dCount > numbers.count || numbers.count == 0 {
                error = true
                break
            } else {
                if reversed {
                    endIndex -= 1
                } else {
                    startIndex += 1
                }
            }
        }
    }
    
    if error {
        print("error")
    } else if error == false && startIndex > endIndex {
        print("error")
    } else {
        if reversed {
            print("[\( numbers[startIndex..<endIndex].reversed().joined(separator: ",") )]")
        } else {
            print("[\( numbers[startIndex..<endIndex].joined(separator: ",") )]")
        }
    }
}
