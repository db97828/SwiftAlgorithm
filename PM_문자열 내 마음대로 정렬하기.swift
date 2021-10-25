//
//  PM_문자열 내 마음대로 정렬하기.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/25.
//

import Foundation

func solution_문자열_내_마음대로_정렬하기_1(_ strings:[String], _ n:Int) -> [String] {
    return  strings.sorted().map{$0.map{String($0)}}.sorted{ $0[n] < $1[n] }.map{$0.joined()}
}

func solution_문자열_내_마음대로_정렬하기_2(_ strings:[String], _ n:Int) -> [String] {
    return  strings.sorted{ Array($0)[n] == Array($1)[n] ? $0 < $1 : Array($0)[n] < Array($1)[n] }
}
