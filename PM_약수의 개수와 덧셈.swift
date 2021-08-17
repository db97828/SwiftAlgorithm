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
