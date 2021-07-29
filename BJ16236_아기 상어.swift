import Foundation

let max_int = 21        //n은 최대 20이므로
let max_dist = 401
let dx = [0,0,1,-1]     //상하좌우
let dy = [1,-1,0,0]

var min_dist = max_dist
var min_x = max_int
var min_y = max_int
var sharkSize = 2
var shark_x = 0
var shark_y = 0
var answer = 0
var eatCount = 0
var n = 0
var map: [[Int]] = []
var check: [[Int]] = []

func sol16236() {
   n = Int(readLine()!)!
   map = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
   check = [[Int]](repeating: [Int](repeating: -1, count: n), count: n)

   //지도 만들어주기 && 상어 초기 위치 구하기
   for i in 0..<n {
       map[i] = readLine()!.split(separator: " ").map{ Int(String($0))! }
       if map[i].contains(9) {
           for j in 0..<n {
               if map[i][j] == 9 {
                   shark_x = i
                   shark_y = j
                   map[i][j] = 0
               }
           }
       }
   }
   
   while(true) {
       //초기화 시켜주기
       min_dist = 401
       min_x = 21
       min_y = 21
       check = [[Int]](repeating: [Int](repeating: -1, count: n), count: n)
       
       bfs(x: shark_x, y: shark_y)
       
       if min_x != max_int && min_y != max_int {
           //먹을 수 있는 물고기를 찾은 경우
           answer += check[min_x][min_y]   //이동시간을 더함
           eatCount += 1   //물고기 먹음 체크
           
           if eatCount == sharkSize {
               //상어 크기만큼 물고기를 먹으면 상어 크기를 +1해주고, eatCount 초기화
               sharkSize += 1
               eatCount = 0
           }
           
           map[min_x][min_y] = 0   //먹은 물고기 위치 0으로 변경
           
           shark_x = min_x         //상어 위치도 변경
           shark_y = min_y
       } else {
           //먹을 수 있는 물고기가 없는 경우 종료
           break
       }
   }
   print(answer)
}

func bfs(x: Int, y: Int) {
   var queue: [Position] = []
   check[x][y] = 0     //상어 첫 위치의 시간 0으로 초기화
   queue.append(Position(x: x, y: y))
   
   while !queue.isEmpty {
       let cur = queue.removeFirst()
       let x = cur.x
       let y = cur.y
       
       for i in 0..<4 {
           let nx = x + dx[i]
           let ny = y + dy[i]
           
           if nx < 1 || nx > n || ny < 1 || ny > n { continue}     //범위를 벗어나면 건너뜀
           if check[nx][ny] != -1 || map[nx][ny] > sharkSize { continue }  //이미 방문했거나, 상어보다 큰 물고기는 건너뜀
           
           check[nx][ny] = check[x][y] + 1     //이전까지 이동거리 + 1을 해서 넣어줌
           
           if map[nx][ny] != 0 && map[nx][ny] < sharkSize {
               //먹을 수 있는 물고기인 경우(물고기이고, 상어보다 작은 물고기)
               if min_dist > check[nx][ny] {
                   //이동시간이 더 적은 경우
                   min_x = nx
                   min_y = ny
                   min_dist = check[nx][ny]
               } else if min_dist == check[nx][ny] {
                   //이동 시간이 같은 경우 -> 가장 위쪽, 가장 왼쪽으로 이동
                   if min_x == nx {
                       if min_y > ny {
                           min_x = nx
                           min_y = ny
                       }
                   } else if min_x > nx {
                       min_x = nx
                       min_y = ny
                   }
               }
           }
           
           queue.append(Position(x: nx, y: ny))        //물고기의 위치를 큐에 넣어줌
       }
   }
}

struct Position {
   var x: Int
   var y: Int
}

