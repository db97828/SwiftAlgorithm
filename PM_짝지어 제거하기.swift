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
     var stack: [Character] = []
     
     for c in s {
         if stack.isEmpty { stack.append(c) }
         else {
             if stack.last == c { stack.removeLast() }
             else { stack.append(c) }
         }
     }
     
     return stack.isEmpty ? 1 : 0
 }

// -> 다른 방법
func solution(_ s:String) -> Int{
    let str = Array(s)
    var array: [Character] = []
    
    if str.count % 2 != 0 { return 0 }
//    ==> guard str.count % 2 == 0 else { return 0 }
    
    for c in str {
        array.append(c)
        
        while array.count > 1 && array[array.count-1] == array[array.count-2] {
            array.removeLast()
            array.removeLast()
        }
    }
    
    return array.isEmpty ? 1 : 0
}
