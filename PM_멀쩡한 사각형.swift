import Foundation

//빗선이 지나가는 사각형의 개수 : 가로 + 세로 - (가로 세로의 최대 공약수)
//미리 Int64로 변환하지 않으면 시간초과
func solution멀쩡한사각형(_ w:Int, _ h:Int) -> Int64{
    let w = Int64(w), h = Int64(h)
    return Int64(w*h-(w+h-gcd(w, h)))
}

func gcd(_ a: Int64, _ b: Int64) -> Int64 {
    if b == 0 { return a }
    else { return gcd(b, a%b)}
}
