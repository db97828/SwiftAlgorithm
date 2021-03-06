import Foundation

func solution약수의_개수와_덧셈_1(_ left:Int, _ right:Int) -> Int {
    var answer = 0
    for i in left...right {
        var divisor = 0
        for j in 1...i {
            if i % j == 0 { divisor += 1 }
        }
//         if divisor % 2 == 0 {answer += i}
//         else {answer -= i}
        answer += divisor % 2 == 0 ? i : -i
    }
    return answer
}

func solution약수의_개수와_덧셈_2(_ left:Int, _ right:Int) -> Int {
    return (left...right).map{ i in (1...i).filter{$0 % i == 0}.count % 2 == 0 ? i : -i}.reduce(0, +)
}

func solution약수의_개수와_덧셈_3(_ left:Int, _ right:Int) -> Int {
    var answer = 0
    for number in left...right {
        //홀수 -> 제곱수 / 짝수 -> 제곱수X 이므로 제곱근 씌워서 정수인 것은 약수 홀수개 아니면 짝수개!!
        answer += floor(sqrt(Double(number))) == sqrt(Double(number)) ? -number : number
    }
    return answer
}
