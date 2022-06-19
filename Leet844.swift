func backspaceCompare(_ s: String, _ t: String) -> Bool {
   var newS: [Character] = []
   var newT: [Character] = []

   s.forEach {
       if $0 != "#" {
           newS.append($0)
       } else if $0 == "#" && !newS.isEmpty {
           newS.removeLast()
       }
   }

   t.forEach {
       if $0 != "#" {
           newT.append($0)
       } else if $0 == "#" && !newT.isEmpty {
           newT.removeLast()
       }
   }

   return newT == newS
}
