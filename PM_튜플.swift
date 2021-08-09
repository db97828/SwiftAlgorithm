func solution튜플(_ s:String) -> [Int] {
    var answer: [Int] = []
    var s = s
    s.removeFirst(2)
    s.removeLast(2)
    
    s.components(separatedBy: "},{")
        .map{$0.components(separatedBy: ",").map{ Int($0)!}}
        .sorted{ $0.count < $1.count }
        .forEach{
            $0.forEach{
                if !answer.contains($0) {
                    answer.append($0)
                }
            }
        }
    
    return answer
}
