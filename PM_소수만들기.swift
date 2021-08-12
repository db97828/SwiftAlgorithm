import Foundation

func solution소수만들기(_ nums:[Int]) -> Int {
    var sum: [Int] = []
    for i in 0..<nums.count-2 {
        for j in i+1..<nums.count {
            for k in j+1..<nums.count {
                sum.append(nums[i] + nums[j] + nums[k])
            }
        }
    }
    return sum.filter{isPrime($0)}.count
}

func isPrime(_ num: Int) -> Bool {
    for i in 2..<num {
        if num % i == 0 { return false }
    }
    return true
}
