//
//  PM_조이스틱.swift
//  Algorithm
//
//  Created by dabeen on 2021/12/02.
//

import Foundation

//마지막 테스트케이스 실패 (-> ABAAAAAAAAAABAB 이렇게 중간에 A가 많은 경우 되돌아 가는 것이 더 좋음)
func solution_조이스틱_1(_ name:String) -> Int {
    let alpha = "ABCDEFGHIJFLMNOPQRSTUVWXYZ".map{ String($0) }
    let name = name.map{ String($0) }
    var targetName = [String](repeating: "A", count: name.count)
    var answer = 0
    
    var index = 0
    let h = name[1] == "A" ? -1 : 1
    var count = 0
    
    while true {
        if targetName == name { return answer }
        count += 1
        if targetName[index] != name[index] {
            let targetIndex = alpha.firstIndex(of: name[index])!
            answer += min(targetIndex, 26-targetIndex)
            targetName[index] = name[index]
        }
        if index == 0 && h == -1{
            index = name.count
        }
        if count == name.count || targetName == name { return answer }
        index += h
        answer += 1
    }
    
    return answer
}

func solution_조이스틱_2(_ name:String) -> Int {
    let alpha = "ABCDEFGHIJFLMNOPQRSTUVWXYZ".map{ String($0) }
    let name = name.map{ String($0) }
    var answer = 0
    
    //위/아래 횟수 먼저 더해줌
    for i in 0..<name.count {
        let targetIndex = alpha.firstIndex(of: name[i])!
        answer += min(targetIndex, 26-targetIndex)
    }
    
    //이동 횟수 더해줌
    var minMove = name.count - 1
    for i in 0..<name.count {
        if name[i] != "A" {
            var next = i + 1
            while next < name.count && name[next] == "A" {
                next += 1
            }
            //i만큼 갔다가 i만큼 다시 돌아감(i*2) + 전체 카운트에서 중간에 있는 A갯수 빼줌
            //그냥 뒤로 한 칸 씩 가는 것과 왔다가는 것 중 작은 수 더해줌
            minMove = min(minMove, 2 * i + name.count - next)
        }
    }
    
    return answer + minMove
}
