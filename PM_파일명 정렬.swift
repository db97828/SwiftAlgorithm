//
//  PM_파일명 정렬.swift
//  Algorithm
//
//  Created by dabeen on 2021/11/19.
//

import Foundation

func solution_파일명_정렬_1(_ files:[String]) -> [String] {
    //tail이 null인 경우 확인하기!
    struct File {
        var origin:String
        var head:String
        var number:Int
    }

    var sortedFiles = [File]()
    for file in files {
        var head = ""
        var number = ""
        for ch in file {
            if !ch.isNumber {
                if number == "" {
                    head.append(ch.lowercased())
                } else {
                    sortedFiles.append(File(origin: file, head: head, number: Int(number)!))
                    head = ""
                    number = ""
                    break
                }
            } else {
                if number.count <= 5 {
                    number.append(ch)
                }else {
                    sortedFiles.append(File(origin: file, head: head, number: Int(number)!))
                    head = ""
                    number = ""
                    break
                }
            }
        }
        if head != "" || number != "" {
            sortedFiles.append(File(origin: file, head: head, number: Int(number)!))
        }
    }
    
    return sortedFiles.sorted{ $0.head == $1.head ? $0.number < $1.number : $0.head < $1.head }.map{$0.origin}
}


//extension 활용하기.....bb
func solution_파일명_정렬_2(_ files:[String]) -> [String] {
    return files.enumerated().sorted{ (lhs, rhs) in
        let l = lhs.element
        let r = rhs.element
        if l.head != r.head { return l.head < r.head }
        if l.number != r.number { return l.number < r.number }
        return lhs.offset < rhs.offset
    }.map{ $0.element }
}

extension String{
    var numeric: ClosedRange<Character> { return "0"..."9" }
    var head:String {
        return self.prefix{ !numeric.contains($0) }.uppercased()
    }
    var number:Int {
        return Int(self.drop{ !numeric.contains($0) }
                    .prefix{ numeric.contains($0) })!
    }
}
