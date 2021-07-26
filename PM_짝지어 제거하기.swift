import Foundation

// -> 시간초과 (2,10,13만 맞음 / 10.4점)
 func solution(_ s:String) -> Int{
     var s = Array(s)
     
     while !s.isEmpty {
         for i in 0..<s.count-1 {
             let first = s[i]
             let second = s[i+1]
         
             if first == second {
                 s.remove(at: i+1)
                 s.remove(at: i)
                 if s.isEmpty { return 1 }
                 break
             } else {
                 if i == s.count - 2 { return 0 }
                 else { continue }
             }
         }
     }
     
     return 0
 }

// -> 성공 Stack 사용해서 풀기
 func solution(_ s:String) -> Int{
     var answer:Int = -1
     var stack: [Character] = []
     
     for c in s {
         if stack.isEmpty { stack.append(c) }
         else {
             if stack.last == c { stack.removeLast() }
             else { stack.append(c) }
         }
     }

     if stack.isEmpty { answer = 1 }
     else { answer = 0 }
     
     return answer
 }
