//
//  PM_2016년.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/20.
//

import Foundation

func solution_2016년_1(_ a:Int, _ b:Int) -> String {
    let month = [31,29,31,30,31,30,31,31,30,31,30,31]
    let day = [1:"FRI",2:"SAT",3:"SUN",4:"MON",5:"TUE",6:"WED",0:"THU"]
    
    return day[(month[0..<(a-1)].reduce(0, +) + b) % 7]!
}

func solution_2016년_2(_ a:Int, _ b:Int) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US")
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let date = dateFormatter.date(from: "2016-\(a)-\(b)")
    dateFormatter.dateFormat = "E"
    return dateFormatter.string(from: date!).uppercased()
}
