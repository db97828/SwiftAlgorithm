
import Foundation

func solution_k번째수_1(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var answer: [Int] = []
    
    commands.forEach{
        var array = array
        let i = $0[0]-1
        let j = $0[1]-1
        let k = $0[2]-1
        array = array[i...j].sorted()
        answer.append(array[k])
    }
    return answer
}

func solution_k번째수_2(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    return commands.map{ array[$0[0]-1...$0[1]-1].sorted()[$0[2]-1] }
}
