import Foundation

let dx = [0,0,-1,1] //상하좌우
let dy = [1,-1,0,0] //상하좌우

let t = Int(readLine()!)!
var map: [[Int]] = []
var check: [[Bool]] = []
var m = 0
var n = 0

for _ in 0..<t {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    m = input[0]        //가로길이
    n = input[1]        //세로길이
    let k = input[2]        //배추가 심어져 있는 위치 개수

    map = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
    check = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)

    var answer = 0

    for _ in 0..<k {
        let cabbage = readLine()!.split(separator: " ").map{Int($0)!}
        //[0]:x [1]:y -> map[y][x]
        map[cabbage[1]][cabbage[0]] = 1
    }

    for i in 0..<n {
        for j in 0..<m {
            if map[i][j] == 1 && !check[i][j]{
                bfs(x: j, y: i)
                answer += 1
            }
        }
    }
    print(answer)
}


func bfs(x: Int, y: Int){
    check[y][x] = true
    
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if isBoundary(x: nx, y: ny) && map[ny][nx] == 1 && !check[ny][nx] { bfs(x: nx, y: ny) }
    }
}

func isBoundary(x: Int, y:Int) -> Bool {
    return x < m && x >= 0 && y < n && y >= 0
}
