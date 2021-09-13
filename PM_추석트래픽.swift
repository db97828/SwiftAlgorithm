//
//  PM_추석트래픽.swift
//  Algorithm
//
//  Created by dabeen on 2021/09/13.
//

import Foundation

func solution_추석트래픽(_ lines:[String]) -> Int {
    if lines.count == 1 {return 1}
    var requests = [(Float, Float)]()
    
    lines.forEach{
        let line = $0.split(separator: " ").map{String($0)}
        let time = line[1].split(separator: ":").map{Float($0)!}
        
        let hour = time[0] * 3600
        let min = time[1] * 60
        let sec = time[2]
        let duration = Float(line[2].replacingOccurrences(of: "s", with: ""))!
        
        let end = hour + min + sec
        let start = end - duration + 0.001
        
        requests.append((start, end+1))
    }
    
    var counts = [Int](repeating: 1, count: requests.count)
    
    for (i,request) in requests.enumerated() {
        counts[i] += requests[(i+1)...].filter{request.1 > $0.0}.count
    }
    
    return counts.max() ?? 1
}

