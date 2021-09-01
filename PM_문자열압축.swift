//
//  PM_문자열압축.swift
//  Algorithm
//
//  Created by dabeen on 2021/08/31.
//

//https://leechamin.tistory.com/434

import Foundation

func solution_문자열_압축(_ s:String) -> Int {
    var answer = s.count
    if s.count <= 2 { return s.count}
    
    for len in 1...s.count/2 {        //문자열의 반 이상이 되면 완성이 안됨 -> 반절까지만 구하면됨
        //1개부터 반절까지 늘려가면서 체크
        var s = s.map{$0}
        var cur = ""
        var res = ""
        var count = 1
        
        while s.count >= len {      //남은 문자열이 자르는 문자열길이보다 길어야함
            let v = s[..<len]       //잘라낸 문자열을 꺼냄
            if cur == "" {cur = String(v)}      //꺼낸 문자열을 이전 문자열과 비교
            else if cur == String(v) {count += 1}
            else{
                //다른 문자열을 만나면 res에 추가하고 count초기화&cur에 현재문자저장
                if count == 1 {res += cur}
                else {res.append("\(count)\(cur)")}
                cur = String(v)
                count = 1
            }
            s.removeFirst(len)      //현재 문자열까지 삭제(cur)
        }
        //마지막에 남은 문자열 추가
        if count == 1 {res += cur}
        else { res.append("\(count)\(cur)")}
        if !s.isEmpty {res += s}
        
        //더 작은 것 저장
        if answer > res.count {answer = res.count}
    }
    
    return answer
}
