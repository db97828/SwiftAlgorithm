//
//  PM_수박수박수박수박수박수? .swift
//  Algorithm
//
//  Created by dabeen on 2021/10/25.
//

import Foundation

func solution_수박수박수박수(_ n:Int) -> String {
    return (0..<n).map{
        if $0 % 2 == 0 { return "수"}
        else { return "박" }
    }.joined()
}
