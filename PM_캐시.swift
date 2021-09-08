//
//  PM_캐시.swift
//  Algorithm
//
//  Created by dabeen on 2021/09/08.
//

import Foundation

func solution_캐시_1(_ cacheSize:Int, _ cities:[String]) -> Int {
    var answer = 0
    var queue = [String]()

    if cacheSize == 0 { return cities.count * 5 }
    
    for city in cities {
        let city = city.lowercased()
        if queue.isEmpty {
            queue.append(city)
            answer += 5
        }else {
            if queue.contains(city){
                answer += 1
                queue.append(queue.remove(at: queue.firstIndex(of: city)!))
            } else {
                answer += 5
                queue.append(city)
                if queue.count > cacheSize {queue.removeFirst()}
            }
        }
    }
    
    return answer
}

func solution_캐시_2(_ cacheSize:Int, _ cities:[String]) -> Int {
    var answer = 0
    var cache = [String]()
    
    if cacheSize == 0 { return cities.count * 5 }
    
    for city in cities {
        let city = city.lowercased()
        if let i = cache.firstIndex(of: city) {
            cache.remove(at: i)
            answer += 1
        } else {
            if cache.count >= cacheSize { cache.removeFirst() }
            answer += 5
        }
        cache += [city]
    }
    
    return answer
}
