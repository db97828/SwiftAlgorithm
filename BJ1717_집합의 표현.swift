import Foundation

// ->  성공 (Union find로 풀기)
  let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
  var parents = Array(0...input[0])

  for _ in 0..<input[1] {
      let op = readLine()!.split(separator: " ").map{ Int(String($0))! }
      let a = op[1]
      let b = op[2]

      if op[0] == 0 {
          guard a != b else { continue }
          union(a, b)
      } else {
          print(parent(of: a) == parent(of: b) ? "YES" : "NO")
      }
  }

  func parent(of i: Int) -> Int {
      guard parents[i] != i else { return i }
      parents[i] = parent(of: parents[i])
      return parents[i]
  }

  func union(_ a: Int, _ b: Int) {
      let aParent = parent(of: a)
      let bParent = parent(of: b)
      guard aParent != bParent else { return }
      parents[bParent] = aParent
  }

/* -> 시간초과
 let input = readLine()!.split(separator: " ")
 let n = Int(input[0])!
 let m = Int(input[1])!
 
 var array = [[Int]](repeating: [0], count: n+1)
 
 for i in 0...n {
     array[i][0] = i
 }
 
 for _ in 0..<m {
     let op = readLine()!.split(separator: " ")
     let first = Int(op[1])!
     let second = Int(op[2])!
     if op[0] == "0" {
         if op[1] != op[2] {
             array[first].append(contentsOf: array[second])
             for s in array[first] {
                 array[s] = array[first]
             }
         }
     } else {
         if op[1] == op[2] { print("YES") }
         else if array[first].contains(second) { print("YES") }
         else { print("NO") }
     }
     
     for i in 0...n {
         print("array[\(i)] = \(array[i])")
     }
 }
 */

/*
 let input = readLine()!.split(separator: " ")
 let n = Int(input[0])!
 let m = Int(input[1])!
 
 var array = Array(repeating: [Int](), count: n+1)
 
 for i in 0...n {
     array[i] += [i]
 }
 
 for _ in 0..<m {
     let op = readLine()!.split(separator: " ")
     let first = Int(op[1])!
     let second = Int(op[2])!
     
     var firstIdx: Int?
     var secondIdx: Int?
    
     for i in 0..<array.count {
         
         if array[i].firstIndex(of: first) != nil {
             print("first : \(i)")
             firstIdx = i
         }
         
         if array[i].firstIndex(of: second) != nil {
             print("second : \(i)")
             secondIdx = i
         }
     }
     
     if op[0] == "0" {
         if op[1] != op[2] {
             array[firstIdx!].append(contentsOf: array[secondIdx!])
             array.remove(at: secondIdx!)
         }
     } else {
         if op[1] == op[2] { print("YES") }
         else if firstIdx == secondIdx { print("YES") }
         else { print("NO") }
     }
 }
 */
