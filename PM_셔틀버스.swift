//
//  PM_셔틀버스.swift
//  Alogrithm
//
//  Created by etnersrnd on 2021/12/21.
//

import Foundation
/*
print(solution(1,1,5,["08:00", "08:01", "08:02", "08:03"]))

print(solution(2,10,2,["09:10", "09:09", "08:00"]))
print(solution(2,1,2,["09:00", "09:00", "09:00", "09:00"]))
print(solution(1,1,5,["00:01", "00:01", "00:01", "00:01", "00:01"]))
print(solution(1,1,1,["10:00", "23:59", "01:10", "15:31"]))
print(solution(10,60,45,["23:59","23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59", "23:59"]))
print(solution(1,1,5,["00:01", "00:01", "00:02","00:02", "00:03", "00:03", "00:03", "00:04"]))
print(solution(2,10,3,["09:05","09:09","09:13"]))
*/

func solution_셔틀버스_1(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {

    func convertTimeToString(_ time:Int) -> String {
        let hour = time / 60 < 10 ? "0\(time/60)" : "\(time/60)"
        let min = time % 60 < 10 ? "0\(time%60)" : "\(time%60)"
        return "\(hour):\(min)"
    }

    var timetable = timetable.sorted().map{ $0.split(separator: ":").map{Int(String($0))!} }
    var answer = "09:00"
    
    for i in 0..<n {
        if timetable.count < m {
            return convertTimeToString(540 + ((n-1) * t))
        }
        var count = 0
        while !timetable.isEmpty && count < m {
            var first = timetable.first!
            if first[0] * 60 + first[1] <= 540 + i * t {
                count += 1
                first = timetable.removeFirst()
                answer = convertTimeToString(first[0] * 60 + first[1] - 1)
            } else { break }
        }
        if i == n - 1 && count < m {
            return convertTimeToString(540 + ((n-1) * t))
        }
    }
    return answer
}


func solution_셔틀버스_2(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    let startTime = 540
    let sortedTimeTable = timetable.sorted().map{ Int($0.prefix(2))! * 60 + Int($0.suffix(2))! }
    var crewIndex = 0
    for i in 0..<n {
        var cnt = 0
        while crewIndex < sortedTimeTable.count, sortedTimeTable[crewIndex] <= startTime + i*t {
            cnt += 1
            crewIndex += 1
            if cnt == m {
                guard i != n-1  else {
                    return String(format: "%02d:%02d", (sortedTimeTable[crewIndex-1]-1)/60, (sortedTimeTable[crewIndex-1]-1) % 60)
                }
                break
            }
        }
    }
    let lastTime = startTime + (n-1) * t
    return String(format: "%02d:%02d", lastTime/60, lastTime%60)
}
