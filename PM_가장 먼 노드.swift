import Foundation

var MX = 0

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var graph = [[Int]](repeating: [Int](), count: n+1)
    var visited = [Int](repeating: 0, count: n+1)
    var answer = [Int](repeating: 0, count: n+1)
    
    for i in edge.indices {
        graph[edge[i][0]].append(edge[i][1])
        graph[edge[i][1]].append(edge[i][0])
    }
    
    BFS(&graph, &visited, &answer)
    return answer[MX]
}

func BFS(_ graph: inout [[Int]], _ visited: inout [Int], _ answer: inout [Int]) {
    var queue = [Int]()
    visited[1] = 1
    var cur = 0
    queue.append(1)
    
    while cur < queue.count {
        let now = queue[cur]
        cur += 1
        
        for i in graph[now].indices {
            let next = graph[now][i]
            if visited[next] == 0 {
                visited[next] = visited[now] + 1
                answer[visited[next]] += 1
                MX = MX > visited[next] ? MX : visited[next]
                queue.append(next)
            }
        }
    }
}
