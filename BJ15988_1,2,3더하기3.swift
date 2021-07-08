//
//  BJ15988.swift
//  Algorithm
//
//  Created by dabeen on 2021/06/30.
//

let T = Int(readLine()!)!
var dp = [CLong](repeating: 0, count: 1000001)
dp[1] = 1
dp[2] = 2
dp[3] = 4

var nums = [CLong](repeating: 0, count: T)

for i in 0..<T {
    nums[i] = CLong(readLine()!)!
}

for j in 4...nums.max()! {
    dp[j] = (dp[j-1] + dp[j-2] + dp[j-3]) % 1000000009
}

for n in nums {
    print(dp[n])
}

