import Foundation

func solution내적_1(_ a:[Int], _ b:[Int]) -> Int {
    var sum = 0
    for i in 0..<a.count {
        sum += a[i] * b[i]
    }
    return sum
}

//->짧지만 위에가 더 빠름
func solution내적_2(_ a:[Int], _ b:[Int]) -> Int {
     return zip(a,b).map(*).reduce(0,+)
}
