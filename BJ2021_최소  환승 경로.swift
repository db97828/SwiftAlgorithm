import Foundation

func solution최소_환승_경로() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let N = input[0]    //역의 개수
    let L = input[1]    //노선의 개수

    var route = [[Int]](repeating: [], count: 2*N+1)
    var dist = [Int](repeating: -1, count: 2*N+1)

    for i in 1...L {
        let line = readLine()!.split(separator: " ").map{(Int(String($0)))!}.filter{$0 != -1}
        
        line.forEach{
            route[$0].append(i+N)   //노선에 연결된 역(중복 막기 위해 N을 더해줌) 추가
            route[i+N].append($0)   //역에 연결된 노선 추가
        }
    }

    let input2 = readLine()!.split(separator: " ").map{Int(String($0))!}
    let start = input2[0]
    let end = input2[1]

    print(bfs())

    func bfs() -> Int{
        var queue: [Int] = []
        dist[start] = 0
        queue.append(start)
        while !queue.isEmpty {
            let x = queue.removeFirst()
            if x == end { return dist[x]-1 > 0 ? dist[x]-1 : 0 }    //종료지점에서 dist[x]-1 반환(환승x시 0반환)
                route[x].forEach{
                    if dist[$0] > -1 {return}   //이미 방문한 곳이면 다음으로 넘어감
                    if $0 > N {dist[$0] = dist[x] + 1}  //역을 만나면 +1
                    else {dist[$0] = dist[x]}   //노선이면 그대로
                    queue.append($0)
                }
        }
        return -1
    }
}
