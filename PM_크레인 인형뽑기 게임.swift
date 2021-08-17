import Foundation

func solution크레인_인형뽑기_게임_1(_ board:[[Int]], _ moves:[Int]) -> Int {
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

func solution크레인_인형뽑기_게임_2(_ board:[[Int]], _ moves:[Int]) -> Int {
    var answer = 0
    var stack = [[Int]](repeating: [], count: board.count)
    var bucket: [Int] = []
    
    board.reversed().forEach{
        $0.enumerated().forEach{
            // $0.enumerated() -> index && value 같이 얻을 수 있음
            if $0.1 != 0 {
                //value가 0이 아니면 stack에 넣기
                stack[$0.0].append($0.1)
            }
        }
    }
    
    moves.forEach{
        // 꺼내는 인형을 doll에 저장
        if let doll = stack[$0-1].popLast() {
            // bucket의 마지막 인형 last에 저장 후 둘이 비교
            if let last = bucket.last, last == doll {
                //같으면 bucket마지막 인형 제거 -> 2개가 제거됨 -> anwer += 2
                bucket.removeLast()
                answer += 2
            } else {
                //다르면 bucket에 넣어주기
                bucket.append(doll)
            }
        }
    }
    
    return answer
}
