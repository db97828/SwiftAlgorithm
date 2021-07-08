//실패 -> 다시풀어보기
import Foundation

struct BeerInfo {
    var priority: Int?
    var level: Int?
}

var beerArr: [BeerInfo] = []
var stack: [BeerInfo] = []

let input = readLine()!.split(separator: " ")
let N = Int(input[0])!
let M = Int(input[1])!
let K = Int(input[2])!

for _ in 0..<K {
    let beer = readLine()!.split(separator: " ")
    var beerInfo = BeerInfo()
    beerInfo.priority = Int(beer[0])
    beerInfo.level = Int(beer[1])
    beerArr.append(beerInfo)
}

beerArr = beerArr.sorted(by: {$0.level! < $1.level!})

var totalN = 0

while stack.count < N && beerArr.count > 0 {
    for b in beerArr {
        if stack.count == 0 || stack.count + 1 < N{
            stack.append(b)
            beerArr.removeFirst()
            totalN = totalN + b.priority!
        } else if stack.count + 1 == N {
            if totalN + b.priority! >= M {
                stack.append(b)
                beerArr.removeFirst()
                totalN = totalN + b.priority!
            } else {
                beerArr.removeFirst()
                break;
            }
        }
    }
}

if totalN < M {
    print(-1)
} else {
    print(stack[stack.endIndex-1].level!)
}


-> 시간초과
 
