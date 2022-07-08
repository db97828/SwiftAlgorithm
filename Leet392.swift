//
//  392.swift
//  Algorithm
//
//  Created by dabeen on 2022/07/07.
//

import Foundation

class Solution_392 {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        let s = s.map { $0 }
        var sIndex = 0

        for char in t {
            if sIndex == s.count { break }
            if char == s[sIndex] {
                sIndex += 1
            }
            continue
        }
        return sIndex == s.count
    }
}
