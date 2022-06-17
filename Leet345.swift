class Solution {
    func reverseVowels(_ s: String) -> String {
        var vowlStack: [Character] = []
        var answer: String = ""

        s.forEach {
            let char = $0.lowercased()
            if char == "a" || char == "e" || char == "i" || char == "o" || char == "u"  {
                vowlStack.append($0)
            }
        }

        s.forEach {
            let char = $0.lowercased()
            if char == "a" || char == "e" || char == "i" || char == "o" || char == "u"  {
                answer.append(vowlStack.removeLast())
            } else {
                answer.append($0)
            }
        }

        return answer
    }
}
