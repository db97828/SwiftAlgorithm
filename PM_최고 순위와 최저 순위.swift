import Foundation

func solution최고순위와최저순위_1(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    let zeroCount = lottos.filter{ $0 == 0 }.count
    let matchCount = lottos.filter{ win_nums.contains($0) }.count
    
    return [getRank(zeroCount+matchCount), getRank(matchCount)]
}

func getRank(_ count: Int) -> Int {
    switch count {
    case 6:
        return 1
    case 5:
        return 2
    case 4:
        return 3
    case 3:
        return 4
    case 2:
        return 5
    default:
        return 6
    }
}

func solution최고순위와최저순위_2(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    let zeroCount = lottos.filter{ $0 == 0 }.count
    let matchCount = lottos.filter{ win_nums.contains($0) }.count
    
    return [min(7-(zeroCount+matchCount),6), min(7-matchCount,6)]
}
