import Foundation

func solution(_ N:Int, _ number:Int) -> Int {
    if N == number {        //N == number이면 바로 1 리턴
        return 1
    }
    
    var answer: Int = -1
    
    func dfs(_ count: Int, _ now: Int) {
        if count > 8 { return }         //갯수가 8보다 커지면 종료
        if now == number {               // 현재 만들어진 숫자(now) == 타켓 숫자(number)이면 종료
            if count < answer || answer == -1 {     //최솟값으로 설정
                answer = count
            }
            return
        }
        
        var NN = 0
        for i in 0..<8 {
            if answer != -1 && answer < count + 1 + i {
                break
            }
            
            NN = NN * 10 + N
            dfs(count + 1 + i, now + NN)
            dfs(count + 1 + i, now - NN)
            dfs(count + 1 + i, now * NN)
            dfs(count + 1 + i, now / NN)
        }
    }
    
    dfs(0, 0)
    
    return answer
}
