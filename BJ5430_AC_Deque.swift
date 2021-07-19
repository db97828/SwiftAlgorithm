import Foundation

let T = Int(readLine()!)!       //테스트케이스 갯수

for _ in 0..<T {
    let pArr = readLine()!     //수행 할 함수
    let _ = readLine()!                 //배열에 들어있는 수 개수
    
    let numbers = Deque(readLine()!.dropFirst().split(separator: ",").map{ String($0) })
    
    var error = false
    var reversed = false
    var dCount = 0

    for p in pArr {
        if p == "R"{
            reversed = !reversed
        } else {
            dCount += 1
            if dCount > numbers.count || numbers.count == 0 || numbers.contains("]"){
                error = true
                break
            } else {
                if reversed {
                    numbers.popLast()
                } else {
                    numbers.popFirst()
                }
            }
        }
    }
    
    if error {
        print("error")
    } else {
        var answer = "["
        if reversed {
            while !numbers.isEmpty {
                answer += "\(numbers.popLast()!),"
            }
        } else {
            while !numbers.isEmpty {
                answer += "\(numbers.popFirst()!),"
            }
        }
        answer = String(answer.dropLast())
        answer += "]"
        print(answer)
    }
}

class Deque<T: Equatable> {
    var enqueue: [T]
    var dequeue: [T] = []
    var count: Int {
        return enqueue.count + dequeue.count
    }
    
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    
    var first: T? {
        if dequeue.isEmpty {
            return enqueue.first
        }
        return dequeue.last
    }
    
    init(_ queue: [T]) {
        enqueue = queue
    }
    
    func pushFirst(_ n: T) {
        dequeue.append(n)
    }
    
    func pushLast(_ n: T) {
        enqueue.append(n)
    }
    
    func popFirst() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
    
    func popLast() -> T? {
        var returnValue: T?
        if enqueue.isEmpty {
            dequeue.reverse()
            returnValue = dequeue.popLast()
            dequeue.reverse()
        } else {
            returnValue = enqueue.popLast()
        }
        return returnValue
    }
    
    func contains(_ n: T) -> Bool {
        return enqueue.contains(n) || dequeue.contains(n)
    }
    
    func removeAll() {
        enqueue.removeAll()
        dequeue.removeAll()
    }
}

