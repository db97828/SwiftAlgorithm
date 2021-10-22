//
//  PM_최대공약수와 최소공배수 .swift
//  Algorithm
//
//  Created by dabeen on 2021/10/22.
//

import Foundation

func solution_최대공약수와_최소공배수(_ n:Int, _ m:Int) -> [Int] {
    
    func GCD(_ n:Int, _ m:Int) -> Int {
        if n % m == 0 { return m }
        else { return GCD(m, n%m) }
    }
    
    return [GCD(n,m), n*m/GCD(n, m)]
}



