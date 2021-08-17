import Foundation

func solution크레인_인형뽑기_게임(_ board:[[Int]], _ moves:[Int]) -> Int {
    var answer = 0
    
    var stack = [[Int]](repeating: [], count: board.count)
    var basket: [Int] = []
    
    for i in (0..<board.count).reversed() {
        for j in 0..<board[i].count {
            if board[i][j] != 0 { stack[j].append(board[i][j]) }
        }
    }
    
    moves.forEach{
        if !stack[$0-1].isEmpty {
            basket.append(stack[$0-1].removeLast())
            
            if basket.count > 1 {
                if basket.last == basket[basket.index(basket.endIndex, offsetBy: -2)] {
                    answer += 2
                    basket.removeLast()
                    basket.removeLast()
                }
            }
        }
    }
    
    return answer
}
