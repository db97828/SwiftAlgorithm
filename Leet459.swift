import Foundation

func repeatedSubstringPattern_정답(_ s: String) -> Bool {
    var tempS = s + s
    tempS.removeFirst()
    tempS.removeLast()
    return tempS.contains(s)
}

func repeatedSubstringPattern_삽질_1(_ s: String) -> Bool {
   let arrayS = s.map { $0 }
   var j: Int = 0
   var pattern: String = ""
   var startIndex: Int = -1

   for i in 1..<s.count {
       if j == startIndex { break }
       if arrayS[i] == arrayS[j] {
           if pattern == "" { startIndex = i }
           pattern.append(arrayS[i])
           j += 1
       } else {
           pattern = ""
           j = 0
       }
   }

   return s.replacingOccurrences(of: pattern, with: "") == ""
}

func repeatedSubstringPattern_삽질_2(_ s: String) -> Bool {
   if s.count % 2 != 0 { return false }
   let arrayS = s.map { $0 }
   let pattern = String(arrayS[0..<arrayS.count/2])
   return pattern+pattern == s
}
