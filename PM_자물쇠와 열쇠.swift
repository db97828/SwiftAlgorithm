//
//  PM_자물쇠와 열쇠.swift
//  Algorithm
//
//  Created by dabeen on 2021/09/02.
//

import Foundation

func solution_자물쇠와_열쇠(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    var keyMap = key
    
    for _ in 0..<4{
        if check(keyMap, lock){ return true }
        keyMap = rotate(keyMap)
    }
    
    return false
}

//키를 90도씩 돌려줌 (기존 col -> row로 가고, row에는 key.count-1-r을 해줌)
func rotate(_ key: [[Int]]) -> [[Int]] {
    var temp = [[Int]](repeating: [Int](repeating: 0, count: key.count), count: key.count)
    
    for r in 0..<key.count {
        for c in 0..<key.count {
//            temp[r][c] = key[key.count-1-c][r]
            temp[key.count-1-c][r] = key[r][c]
        }
    }
    return temp
}

//현재 row, col에서 한 칸씩 이동
func move(_ key: [[Int]], N: Int, row: Int, col: Int) -> [[Int]] {
    var temp = [[Int]](repeating: [Int](repeating: 0, count: N), count: N)
    for r in 0..<key.count {
        for c in 0..<key.count where r + row >= 0 && r + row < N && c + col >= 0 && c + col < N {
            temp[r + row][c + col] = key[r][c]
        }
    }
    return temp
}

func isUnlock(_ key: [[Int]], _ lock: [[Int]]) -> Bool {
    for r in 0..<lock.count {
        for c in 0..<lock.count where key[r][c]^lock[r][c] == 0 {
            //0이 있는 부분이 있으면 빈 공간이 있으므로 -> false
            return false
        }
    }
    return true
}

func check(_ key: [[Int]], _ lock: [[Int]]) -> Bool {
    //-N~N까지 돌면서 체크하기(젤 위에 ->(-N,-N)부터 시작)
    for r in 1-key.count..<lock.count {
        for c in 1-key.count..<lock.count {
            let moveMap = move(key, N: lock.count, row: r, col: c)
            if isUnlock(moveMap, lock) {return true}
        }
    }
    return false
}
