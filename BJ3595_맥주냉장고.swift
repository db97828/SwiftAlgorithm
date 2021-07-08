import Foundation

var min = Int.max
var answer = ""

let n = Int(readLine()!)!

for i in (1...n).reversed() {
   for j in 1...n {
       if(i*j > n) {break}
       for k in 1...n {
           if(i*j*k > n) {break}
           else if(i*j*k == n) {
               if(i*j + j*k + k*i < min){
                   min = i*j + j*k + k*i
                   answer = "\(i) \(j) \(k)"
               }
           }
       }
   }
}

print(answer)
