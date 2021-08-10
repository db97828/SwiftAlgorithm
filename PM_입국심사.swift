import Foundation

//[참고] https://nsios.tistory.com/115
func solution입국심사(_ n:Int, _ times:[Int]) -> Int64 {
    var answer = 0
    let times = times.sorted()
    var maxTime = times.last! * n
    var minTime = 1
    
    while maxTime >= minTime {
        let midTime = (maxTime + minTime) / 2
        var sum = 0
        
        times.forEach{
            sum += midTime / $0
        }
        
        if sum < n { minTime = midTime + 1}
        else {
            maxTime = midTime - 1
            answer = midTime
        }
    }
    
    return Int64(answer)
}
