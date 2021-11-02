//
//  PM_방문길이.swift
//  Algorithm
//
//  Created by dabeen on 2021/11/02.
//

import Foundation

func solution_방문길이_1(_ dirs:String) -> Int {
//  반절 통과 못함 -> 방향성을 생각하지 말아야함
    func isBoundary(_ x:Int, _ y:Int) -> Bool {
        return x >= -5 && x <= 5 && y >= -5 && y <= 5
    }

    var answer = 0
    var x = 0; var y = 0
    var moved = [[Int]]()
    
    for dir in dirs {
        switch dir{
        case "U":
            if isBoundary(x, y+1) {
                if !moved.contains([x,y,x,y+1]) {
                    answer += 1
                    moved.append([x,y,x,y+1])
                }
                y += 1
            }
        case "L":
            if isBoundary(x-1, y) {
                if !moved.contains([x,y,x-1,y]) {
                    answer += 1
                    moved.append([x,y,x-1,y])
                }
                x -= 1
            }
        case "R":
            if isBoundary(x+1, y) {
                if !moved.contains([x,y,x+1,y]) {
                    answer += 1
                    moved.append([x,y,x+1,y])
                }
                x += 1
            }
        case "D":
            if isBoundary(x, y-1) {
                if !moved.contains([x,y,x,y-1]) {
                    answer += 1
                    moved.append([x,y,x,y-1])
                }
                y -= 1
            }
        default:
            break
        }
        
    }
    return answer
}

func solution_방문길이_2(_ dirs:String) -> Int {
    
    func isBoundary(_ x:Int, _ y:Int) -> Bool {
        return x >= -5 && x <= 5 && y >= -5 && y <= 5
    }

    var answer = 0
    var x = 0; var y = 0
    var moved = [[Int]]()
    
    for dir in dirs {
        switch dir{
        case "U":
            if isBoundary(x, y+1) {
                if !moved.contains([x,y,x,y+1]) && !moved.contains([x,y+1,x,y]){
                    answer += 1
                    moved.append([x,y,x,y+1])
                }
                y += 1
            }
        case "L":
            if isBoundary(x-1, y) {
                if !moved.contains([x,y,x-1,y]) && !moved.contains([x-1,y,x,y]) {
                    answer += 1
                    moved.append([x,y,x-1,y])
                }
                x -= 1
            }
        case "R":
            if isBoundary(x+1, y) {
                if !moved.contains([x,y,x+1,y]) && !moved.contains([x+1,y,x,y]) {
                    answer += 1
                    moved.append([x,y,x+1,y])
                }
                x += 1
            }
        case "D":
            if isBoundary(x, y-1) {
                if !moved.contains([x,y,x,y-1]) && !moved.contains([x,y-1,x,y]) {
                    answer += 1
                    moved.append([x,y,x,y-1])
                }
                y -= 1
            }
        default:
            break
        }
        
    }
    return answer
}
