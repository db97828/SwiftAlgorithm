import Foundation

// -> 시간초과
 let s = readLine()!
 let p = readLine()!

 print(s.contains(p) ? "1" : "0" )

// -> 시간초과
 func solution16916() -> Int {
     var s = readLine()!
     let p = readLine()!

     var sChar = s.removeFirst()

     while !s.isEmpty {

         for i in 0..<p.count {
             var vChar = p[p.index(s.startIndex, offsetBy: i)]
             if sChar == vChar {
                 if i == p.count-1 {
                     return 1
                 }
                 if s.isEmpty {
                     return 0
                 } else {
                     sChar = s.removeFirst()
                     continue
                 }
             } else {
                 if s.isEmpty {
                     return 0
                 } else {
                     sChar = s.removeFirst()
                     break
                 }
             }
         }
     }
     return 0
 }

// -> KMP 알고리즘 적용
 let s = Array(readLine()!)
 let p = Array(readLine()!)

 print(KMP(parent: s, pattern: p))

 func KMP(parent: [Character], pattern: [Character]) -> Int {
     let table = makeTable(pattern: pattern)
     let parentLength = parent.count
     let patternLength = pattern.count
     var j = 0
     
     for i in 0..<parentLength {
         while j > 0 && parent[i] != pattern[j] {
             j = table[j - 1]
         }
         if parent[i] == pattern[j] {
             if j == patternLength - 1 { return 1}
             else { j += 1 }
         }
     }
     
     return 0
 }

 func makeTable(pattern: [Character]) -> [Int] {
     let length = pattern.count
     var table = [Int](repeating: 0, count: length)
     var j = 0
     
     for i in 1..<length {
         while j > 0 && pattern[i] != pattern[j] {
             j = table[j - 1]
         }
         if pattern[i] == pattern[j] {
             j += 1
             table[i] = j
         }
     }
     return table
 }
