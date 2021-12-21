//
//  PM_불량사용자.swift
//  Alogrithm
//
//  Created by etnersrnd on 2021/12/21.
//

import Foundation

func solution_불량사용자(_ user_id:[String], _ banned_id:[String]) -> Int {
    
    func isAvailable(_ ban:String, _ user:String) -> Bool {
        if ban.count != user.count { return false }
        if zip(ban, user).filter({ $0.0 != $0.1 && $0.0 != "*"}).count > 0 { return false }
    //    for (b,n) in zip(ban, user) {
    //        if b != n && b != "*" { return false }
    //    }
        return true
    }
    
    func combinate(_ i:Int, _ selected:[String]) {
        // 이 부분 다시 풀어보기
        // set에다가 sort해서 넣어주기!!(Set<[String]>으로 하는게 중요!!)
        if selected.count == banned_id.count {
            combSet.update(with: selected.sorted())
            return
        }
        var selected = selected
        for n in tempArr[i] {
            if selected.contains(n) {
                continue
            }
            selected.append(n)
            combinate(i+1, selected)
            selected.removeLast()
        }
    }
    
    var tempArr = [[String]](repeating: [String](), count: banned_id.count)
    var combSet = Set<[String]>()
    for (index,ban) in banned_id.enumerated() {
        for user in user_id {
            if isAvailable(ban, user) { tempArr[index].append(user) }
        }
    }
    
    combinate(0, [])
    
    return combSet.count
}
