//
//  BJ11725_트리의부모찾기.swift
//  Algorithm
//
//  Created by dabeen on 2021/09/27.
//

import Foundation

//시간초과
func solution1175_트리의부모찾기_1() {
    let n = Int(readLine()!)!
    var tree = [Int]()
    var parentArr = [Int](repeating: -1, count: n+1)
    tree.append(1)

    for _ in 0..<n-1 {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        
        if tree.contains(input[0]) {
            tree.append(input[1])
            parentArr[input[1]] = input[0]
        } else {
            tree.append(input[0])
            parentArr[input[0]] = input[1]
        }
    }

    for i in 2..<n+1 {
        print(parentArr[i])
    }
}

//런타임오류
//반례 -> 입력이 순서대로 나오지 않을 수 있음
func solution1175_트리의부모찾기_2() {
    let n = Int(readLine()!)!
    var parentDic = [Int:Int]()
    parentDic.updateValue(1, forKey: 1)

    for _ in 0..<n-1 {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        
        if parentDic[input[0]] == nil && parentDic[input[1]] == nil {
            parentDic.updateValue(input[0], forKey: input[1])
            parentDic.updateValue(input[1], forKey: input[0])
        } else if parentDic[input[0]] != nil {
            parentDic.updateValue(input[0], forKey: input[1])
        } else if parentDic[input[1]] != nil{
            parentDic.updateValue(input[1], forKey: input[0])
        } else {
            if input[0] == 1 {
                parentDic.updateValue(input[1], forKey: 1)
            } else {
                parentDic.updateValue(input[0], forKey: 1)
            }
        }
        
    }

    for i in 2..<n+1 {
        print(parentDic[i]!)
    }
}

func solution1175_트리의부모찾기_3() {
    let n = Int(readLine()!)!
    var tree = [[Int]](repeating: [Int](), count: n+1)
    var visited = [Bool](repeating: false, count: 100001)
    var parent = [Int](repeating: -1, count: 100001)
    
    for _ in 0..<n-1 {
        let input = readLine()!.split(separator: " ").map{Int(String($0))!}
        
        tree[input[0]].append(input[1])
        tree[input[1]].append(input[0])
    }
    
    findParent(1)
    
    for i in 2...n {
        print(parent[i])
    }
    
    func findParent(_ node:Int) {
        visited[node] = true
        for i in 0..<tree[node].count {
            if visited[tree[node][i]] == false {
                parent[tree[node][i]] = node
                findParent(tree[node][i])
            }
        }
    }
}
