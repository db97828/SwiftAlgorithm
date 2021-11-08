//
//  PM_가장 큰 정사각형.swift
//  Algorithm
//
//  Created by dabeen on 2021/11/08.
//

import Foundation

/*
 문제오류!! 아래 경우 0,1 모두 통과됨...
 
  [[0, 1, 1, 0],[0, 0, 0, 0],[0, 0, 0, 0],[0, 0, 0, 0]]
  [[0, 0, 0, 0],[1, 0, 0, 0],[1, 0, 0, 0],[0, 0, 0, 0]]

  위와 같이 1행 or 1열에만 1이 있는 경우 답은 1 이 되어야 합니다.
 */
func solution_가장_큰_정사각형_1(_ board:[[Int]]) -> Int {
    func isBoundary(_ x:Int, _ y:Int, _ width:Int, _ height:Int) -> Bool {
        return x > 0 && y > 0 && x < width && y < height
    }
    
    var board = board
    let width = board[0].count
    let height = board.count
    var answer = 0

    if width <= 1 || height <= 1 { return 1 }

    for i in 0..<height {
        for j in 0..<width {
            if board[i][j] != 0 {
                if isBoundary(j, i, width, height) {
                    board[i][j] = min(board[i-1][j], board[i][j-1], board[i-1][j-1]) + 1
                }
                answer = max(answer, board[i][j])
            }
        }
    }

    return answer * answer
}

func solution_가장_큰_정사각형_2(_ board:[[Int]]) -> Int {
    var board = board
    let width = board[0].count
    let height = board.count
    var answer = 0

    if width <= 1 || height <= 1 { return 1 }

    for i in 1..<height {
        for j in 1..<width {
            if board[i][j] != 0 {
                board[i][j] = min(board[i-1][j], board[i][j-1], board[i-1][j-1]) + 1
                answer = max(answer, board[i][j])
            }
        }
    }

    return answer * answer
}

func solution_가장_큰_정사각형_3(_ board:[[Int]]) -> Int {
    var newBoard = board

    let row = newBoard.count
    let col = newBoard[0].count
    var answer = 0

    // 행이나 열의 길이가 2 미만이라면 직접 돌리면서 1이 하나라도 있는지 체크
    // 하나라도 있으면 통과.
    if (col < 2 || row < 2) {
        for i in 0 ..< row {
            for j in 0 ..< col {
                if newBoard[i][j] == 1 {
                    answer = 1
                }
            }
        }
    } else {
        // 배열의 [1][1]부터 반복문을 돌린다. (첫 번째 행, 첫 번째 열 무시)
        // 현재 값이 1일 경우, 좌측값, 상단값, 좌측상단값 중 가장 작은 값의 +1 한 값을 현재 값으로 할당
        for i in 1 ..< row {
            for j in 1 ..< col {

                // 1이 아닐 경우 패스! 1인 값만 동적으로 변경해 줍니다.
                if newBoard[i][j] == 1 {
                    // 현재 값의 좌측값, 상단값, 좌측상단값 중 최소값에 +1을 해줍니다.
                    newBoard[i][j] = min(newBoard[i - 1][j], newBoard[i][j - 1], newBoard[i - 1][j - 1]) + 1
                    // 다시 배열을 돌리는 수고를 하지않기 위해서 max값을 찾아 저장해 줍니다.
                    if newBoard[i][j] > answer {
                        answer = newBoard[i][j]
                    }
                }
            }
        }
    }
    return answer * answer
}
