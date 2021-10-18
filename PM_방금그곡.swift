//
//  PM_방금그곡.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/18.
//

import Foundation

func solution_방금그곡_1(_ m:String, _ musicinfos:[String]) -> String {
    struct Music {
        var duration:Int
        var name:String
    }

    var answer = Music(duration: 0, name: "(None)")

    musicinfos.forEach{
        let info = $0.split(separator: ",").map{String($0)}
        let sT = info[0].split(separator: ":").map{Int(String($0))!}
        let startTime = sT[0]*60+sT[1]
        let eT = info[1].split(separator: ":").map{Int(String($0))!}
        let endTime = eT[0]*60+eT[1]
        let duringTime = endTime - startTime
                
        let m = m.replacingOccurrences(of: "C#", with: "c")
        .replacingOccurrences(of: "D#", with: "d")
        .replacingOccurrences(of: "F#", with: "f")
        .replacingOccurrences(of: "G#", with: "g")
        .replacingOccurrences(of: "A#", with: "a")
        
        let melody = info[3].replacingOccurrences(of: "C#", with: "c")
        .replacingOccurrences(of: "D#", with: "d")
        .replacingOccurrences(of: "F#", with: "f")
        .replacingOccurrences(of: "G#", with: "g")
        .replacingOccurrences(of: "A#", with: "a")
        .map{String($0)}
        
        let music = Music(duration: duringTime, name: info[2])

        var totalMelody = ""
        
        for i in 0..<duringTime {
            totalMelody += melody[i%melody.count]
        }
        if totalMelody.contains(m) {
            answer = answer.duration >= music.duration ? answer : music
        }
    }
    
    return answer.name
}


