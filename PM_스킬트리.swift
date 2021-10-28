//
//  PM_스킬트리.swift
//  Algorithm
//
//  Created by dabeen on 2021/10/28.
//

import Foundation

func solution_스킬트리_1(_ skill:String, _ skill_trees:[String]) -> Int {
    var answer = 0
    
outLoop:
    for skill_tree in skill_trees {
        var skill = skill
        for s in skill_tree {
            if skill.contains(s) && skill.first == s {
                skill.removeFirst()
                continue
            } else if skill.contains(s) && skill.first != s {
                continue outLoop
            } else if !skill.contains(s) { continue }
        }
        answer += 1
    }
    
    return answer
}

func solution_스킬트리_2(_ skill:String, _ skill_trees:[String]) -> Int {
    var answer = 0
    
    for tree in skill_trees {
        let list = tree.filter{ skill.contains($0) }
        let subSkill = skill.prefix(list.count)
        if subSkill == list { answer += 1}
    }
    
    return answer
}

func solution_스킬트리_3(_ skill:String, _ skill_trees:[String]) -> Int {
    var answer = 0
    
    for tree in skill_trees {
        let list = tree.filter{ skill.contains($0) }
        if skill.starts(with: list) { answer += 1 }
    }
    
    return answer
}

func solution_스킬트리_4(_ skill:String, _ skill_trees:[String]) -> Int {

    func isAvailable(_ skill:String, _ tree:String) -> Bool {
        let list = tree.filter{ skill.contains($0) }
        return skill.starts(with: list)
    }
    
    return skill_trees.map{ isAvailable(skill, $0) }.filter{ $0 }.count
}
