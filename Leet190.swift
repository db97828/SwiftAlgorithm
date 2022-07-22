//
//  190.swift
//  Algorithm
//
//  Created by dabeen on 2022/07/14.
//

import Foundation

class Solution_190 {
    func reverseBits(_ n: Int) -> Int {
        var f: Int = 31
        var l: Int = 0
        var n: Int = n
        
        while f > l {
            if ((n >> f) & 1) != ((n >> l) & 1) {
               n ^= ((1 << f) | (1 << l))
            }
            f -= 1
            l += 1
        }
        return n
    }
}
