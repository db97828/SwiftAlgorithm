import Foundation

let dx = [1,2,0,0,1,-1]
let dy = [0,0,1,2,1,1]

func solution(_ places:[[String]]) -> [Int] {
    let places = places.map{$0.map{$0.map{String($0)}}}
    var answer: [Int] = []
    
    for place in places {
        answer.append(checkSeat(place) ? 1 : 0)
    }
    
    return answer
}

func checkSeat(_ place: [[String]]) -> Bool {
    for row in 0..<5 {  //x
        for col in 0..<5 {  //y
            if place[row][col] == "P" {
                for i in 0..<6 {
                    //갈 수 있는 곳 돌면서 찾기(맨해튼거리 2이하인 곳)
                    let (nx, ny) = (row+dx[i], col+dy[i])
                    
                    //범위에 있는 P를 만나면 가림막이 있는지 확인
                    if (0..<5).contains(nx) && (0..<5).contains(ny) && place[nx][ny] == "P" {
                        if row == nx {
                            if place[row][col+1] != "X" { return false }
                        } else if col == ny {
                            if place[row+1][col] != "X" { return false }
                        } else {
                            if row > nx {
                                if place[row-1][col] != "X" || place[row][col+1] != "X" { return false }
                            } else {
                                if place[row][col+1] != "X" || place[row+1][col] != "X" { return false }
                            }
                        }
                    }
                }
            }
        }
    }
    return true
}
