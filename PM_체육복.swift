import Foundation

//1,2,3,7,12틀림
func solution체육복_1(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var lost = lost.sorted()
    
    reserve.forEach{
        if lost.contains($0-1) { lost.remove(at: lost.firstIndex(of: $0-1)!)}
        else if lost.contains($0+1) { lost.remove(at: lost.firstIndex(of: $0+1)!)}
    }
    
    return n-lost.count
}

//3,5,7,12틀림
func solution체육복_2(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    let reserve = reserve.sorted()
    var lost = lost.sorted()
    
    reserve.forEach{
        if lost.contains($0-1) { lost.remove(at: lost.firstIndex(of: $0-1)!)}
        else if lost.contains($0+1) { lost.remove(at: lost.firstIndex(of: $0+1)!)}
    }
    
    return n-lost.count
}

//5,12틀림
func solution체육복_3(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    let reserve = reserve.sorted()
    var lost = lost.sorted()
    
    reserve.forEach{
        if lost.contains($0-1) { lost.remove(at: lost.firstIndex(of: $0-1)!)}
        else if lost.contains($0+1) { lost.remove(at: lost.firstIndex(of: $0+1)!)}
        else if lost.contains($0){ lost.remove(at: lost.firstIndex(of: $0)!)}
    }
    
    return n-lost.count
}

//5틀림
func solution체육복_4(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    let reserve = reserve.sorted()
    var lost = lost.sorted()
    
    reserve.forEach{
        if lost.contains($0) { lost.remove(at: lost.firstIndex(of: $0)!)}
        else if lost.contains($0-1) { lost.remove(at: lost.firstIndex(of: $0-1)!)}
        else if lost.contains($0+1){ lost.remove(at: lost.firstIndex(of: $0+1)!)}
    }
    
    return n-lost.count
}

//성공
//여벌의 옷이 있는 학생도 도난당할 수 있음 -> 먼저 빼놓고 해야함
func solution체육복_5(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var reserve = reserve.sorted()
    var lost = lost.sorted()
    
    reserve.forEach{
        if lost.contains($0){
            lost.remove(at: lost.firstIndex(of: $0)!)
            reserve.remove(at: reserve.firstIndex(of: $0)!)
        }
    }
    
    reserve.forEach{
        if lost.contains($0-1) { lost.remove(at: lost.firstIndex(of: $0-1)!)}
        else if lost.contains($0+1){ lost.remove(at: lost.firstIndex(of: $0+1)!)}
    }
    
    return n-lost.count
}

//다른사람 풀이
func solution체육복_6(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    let newReserve = reserve.filter{ !lost.contains($0) }
    let newLost = lost.filter{ !reserve.contains($0) }
    
    var count = newLost.count
    
    newReserve.forEach{
        if newLost.contains($0-1) || newLost.contains($0+1) {
            if count > 0 { count -= 1}
        }
    }
    
    return n-count
}
