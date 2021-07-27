import Foundation

let dx = [0,0,-1,1,1,1,-1,-1]       //상,하,좌,우,상좌,하좌,상우,하우
let dy = [1,-1,0,0,1,-1,1,-1]
var w = 0
var h = 0
var count = 0
var map: [[String]] = [[]]
var visited: [[Bool]] = [[]]

func sol4963() {
    
    while true {
        let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
        w = input[0]
        h = input[1]
        
        if w == 0 && h == 0 { return }
        
        map = [[String]](repeating: [String](), count: h)
        visited = [[Bool]](repeating: [Bool](repeating: false, count: w), count: h)
        count = 0
        
        for i in 0..<h {
            map[i] = readLine()!.split(separator: " ").map{ String($0) }
        }
        
        for i in 0..<h {
            for j in 0..<w {
                if !visited[i][j] && map[i][j] == "1" {
                    dfs(x: i, y: j)
                    count += 1
                }
            }
        }
        
        print(count)
    }

}

func isBoundary(x: Int, y: Int, w: Int, h: Int) -> Bool {
    return x >= 0 && x < w && y >= 0 && y < h
}

func dfs(x: Int, y: Int) {
    if !visited[x][y] {
        visited[x][y] = true
        
        if map[x][y] == "1" {
            for i in 0...8 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if isBoundary(x: nx, y: ny, w: w, h: h) {
                    dfs(x: nx, y: ny)
                }
            }
        }
    }
}
