import Foundation

//빗선이 지나가는 사각형의 개수 : 가로 + 세로 - (가로 세로의 최대 공약수)
//미리 Int64로 변환하지 않으면 시간초과
func solution_멀쩡한사각형_1(_ w:Int, _ h:Int) -> Int64{
    let w = Int64(w), h = Int64(h)
    return Int64(w*h-(w+h-gcd(w, h)))
}

func gcd(_ a: Int64, _ b: Int64) -> Int64 {
    if b == 0 { return a }
    else { return gcd(b, a%b)}
}

//일차함수로 생각하고 풀어보기
func solution_멀쩡한사각형_2(_ w:Int, _ h:Int) -> Int64{
    //y = (h/w) * x
    var answer:Int64 = 0
    if w > 1 {
        for i in 1..<w {
            answer += Int64(Double(h) * Double(i) / Double(w))
        }
    }
    return answer * 2
}

func solution_멀쩡한사각형_3(_ w:Int, _ h:Int) -> Int64{
    // 시간초과
    return (1..<w).map{ Int64(Double(h) * Double($0) / Double(w)) }.reduce(0, +) * 2
}
