//
//  PM_나누어 떨어지는 숫자 배열 .swift
//  Algorithm
//
//  Created by dabeen on 2021/10/22.
//

import Foundation

func solution_나누어_떨어지는_숫자_배열_1(_ arr:[Int], _ divisor:Int) -> [Int] {
    return arr.filter{$0 % divisor == 0}.count == 0 ? [-1] : arr.filter{$0 % divisor == 0}.sorted()
}

func solution_나누어_떨어지는_숫자_배열_2(_ arr:[Int], _ divisor:Int) -> [Int] {
    //비슷한데 얘가 조금 더 빠름
    let arr = arr.filter{$0 % divisor == 0}
    return arr.count == 0 ? [-1] : arr.sorted()
}
