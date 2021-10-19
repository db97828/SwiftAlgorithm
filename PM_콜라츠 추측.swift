//
//  PM_콜라츠 추측.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/19.
//

import Foundation

func solution_콜라츠_추측_1(_ num:Int) -> Int {
    var num = num
    var answer = 0
    
    while(num != 1 && answer < 500) {
        if num % 2 == 0 { num /= 2 }
        else { num = num * 3 + 1}
        answer += 1
    }
    
    return answer >= 500 ? -1 : answer
}
