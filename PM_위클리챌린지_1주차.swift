import Foundation

// -> 5,8 시간초과
func solution위클리챌린지_1주차_1(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var answer:Int64 = -1
    var sum = 0
    for i in 1...count {
        sum += price * i
    }
    
    if money > sum { answer = 0 }
    else { answer = Int64(sum - money) }
    
    return answer
}

// -> 성공
// sum에서 빼지 말고 바로 빼면서 비교 후 결과값에 따라 return해주기
func solution위클리챌린지_1주차_2(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    var money = money
    for i in 1...count {
        money -= (price * i)
    }
    return Int64(money < 0 ? (money * -1) : 0)
}

// -> 수학적으로 접근하기 (젤 빠름)
//1+2+...n -> (n*(n+1)/2)
func solution위클리챌린지_1주차_3(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    return Int64(max((count + 1) * count / 2 * price - money, 0))
}
