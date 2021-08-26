//
//  BJ2941_크로아티아알파벳.swift
//  Algorithm
//
//  Created by dabeen on 2021/08/26.
//

import Foundation

func soultion_크로아티아알파벳() {
    print(readLine()!
        .replacingOccurrences(of: "c=", with: "A")
        .replacingOccurrences(of: "c-", with: "A")
        .replacingOccurrences(of: "dz=", with: "A")
        .replacingOccurrences(of: "d-", with: "A")
        .replacingOccurrences(of: "lj", with: "A")
        .replacingOccurrences(of: "nj", with: "A")
        .replacingOccurrences(of: "s=", with: "A")
        .replacingOccurrences(of: "z=", with: "A")
        .map{$0}.count)
}
