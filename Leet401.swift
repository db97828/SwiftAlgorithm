class Leet401 {
    typealias Time = (num: Int, type: String)
    
    let target: [Time] = [(1,"H"),(2,"H"),(4,"H"),(8,"H"),(1,"M"),(2,"M"),(4,"M"),(8,"M"),(16,"M"),(32,"M")]
    var answer: [String] = []

    func readBinaryWatch(_ turnedOn: Int) -> [String] {
        combination(target, turnedOn, 0, [])
        return answer
    }
    
    func combination(_ target: [Time], _ tartgetNum: Int, _ index: Int, _ result: [Time]) {
        if result.count == tartgetNum {
            let hour: Int = result.filter { $0.type == "H" }.map { $0.num }.reduce(0,+)
            let minute: Int = result.filter { $0.type == "M" }.map { $0.num }.reduce(0,+)
            if hour < 12 && minute <= 59 {
                answer.append(String(format: "%d:%02d", hour, minute))
            }
            return
        }

        for i in index..<target.count {
            combination(target, tartgetNum, i+1, result + [target[i]])
        }
    }
}
