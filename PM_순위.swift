import Foundation

func solution순위(_ n:Int, _ results:[[Int]]) -> Int {
    var answer = 0
    var rank = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)      //이기고 진 결과를 저장 할 배열
    
    results.forEach{ rank[$0[0]-1][$0[1]-1] = 1 }       //result배열의 각 원소들은 0번째가 1번째를 이겼으므로 1로 변경
    
    //플로이드와샬 -> 더 공부 필요함
    for i in 0..<n {
        for j in 0..<n {
            for k in 0..<n {
                //i가j를 이기고, k가 i를 이기면 -> k가 j를 이김
                if rank[i][j] == 1 && rank[k][i] == 1 { rank[k][j] = 1 }
            }
        }
    }
    
    for i in 0..<n {
        var count = 0
        for j in 0..<n {
            //i가 j한테 이기거나 졌으면 경기횟수(?) +1 해줌
            if rank[i][j] == 1 || rank[j][i] == 1 { count += 1 }
        }
        
        //총 경기 결과가 n-1이면 순위를 알 수 있음 -> answer +1해줌
        if count == n-1 { answer += 1 }
    }
    
    return answer
}
