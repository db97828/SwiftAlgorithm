//
//  BJ_1759_암호만들기.swift
//  Algorithm
//
//  Created by dabeen on 2021/09/16.
//

import Foundation

func solution_1759_암호만들기() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let L = input[0]        //C개중에 L개 뽑기 순서상관O
    let C = input[1]
    var words = readLine()!.split(separator: " ").map{String($0)}.sorted()
    let visited = [Bool](repeating: false, count: words.count)
    var answer = [String]()
    let moeum = ["a","e","i","o","u"]

    permutation(0, L, words, "")
    answer.sorted().forEach{
        print($0)
    }

    func permutation(_ current:Int, _ L:Int, _ words:[String], _ temp:String) {
        if temp.count == L {
            if isRight(temp) { answer.append(temp) }
            return
        }
        if current >= words.count { return }

        permutation(current+1, L, words, temp+words[current])
        permutation(current+1, L, words, temp)
    }

    func isRight(_ password:String) -> Bool {
        var mo = 0
        var ja = 0
        password.forEach{
            if moeum.contains(String($0)) { mo += 1}
            else { ja += 1}
        }
        return mo >= 1 && ja >= 2
    }
}
