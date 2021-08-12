
import Foundation

func solution_k번째수(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var answer: [Int] = []
    commands.forEach{
        var array = array
        let i = $0[0]
        let j = $0[1]
        let k = $0[2]
        array = array[i-1...j-1].sorted()
        answer.append(array[k-1])
    }
    return answer
}
