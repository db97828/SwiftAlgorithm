import Foundation

let t = Int(readLine()!)!
var answer = [String](repeating: "happy", count: t)

struct Position {
   var X: Int?
   var Y: Int?
}

for i in 0..<t {
   let n = Int(readLine()!)!
   var position:[Position] = []
   
   for _ in 0..<n+2 {
       var p = Position()
       let input = readLine()!.split(separator: " ")
       p.X = Int(input[0])
       p.Y = Int(input[1])
       position.append(p)
   }
   
   for j in 1..<position.count {
       if((abs(position[j].X! - position[j-1].X!)) + abs((position[j].Y! - position[j-1].Y!)) > 1000) {
           answer[i] = "sad"
       }
   }
}

for a in answer {
   print(a)
}


