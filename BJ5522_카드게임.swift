//
//  BJ5522_카드게임.swift
//  Algorithm
//
//  Created by dabeen on 2021/11/04.
//

import Foundation

/*
 * 입력을 무제한으로 받아야 하는 경우(EOF) *
 
 while let a = readLine() { code } 으로 입력은 받고,
 마지막에는 control + D 로 종료할 수 있다
 
 */

func solution5522_카드게임() {
    var number = [Int]()
    while let num = readLine() {
        number.append(Int(num)!)
    }

    print(number.reduce(0, +))
}
