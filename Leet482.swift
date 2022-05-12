class Solution {
    // 내가 푼 풀이
    func licenseKeyFormatting_1(_ s: String, _ k: Int) -> String {
        var s = s.replacingOccurrences(of: "-", with: "").uppercased()
        var answer = ""
        var count = 0
        while !s.isEmpty {
            if count < k {
                answer = "\(s.removeLast())" + answer
                count += 1
            } else {
                answer = "-" + answer
                count = 0
            }
        }
        return answer
    }

    // 참고 한 풀이 1
    func licenseKeyFormatting_2(_ s: String, _ k: Int) -> String {
        var answer = ""
        let s = Array(s.uppercased()).filter { $0 != "-" }
        let firstSetCount = s.count % k

        for i in 0..<firstSetCount {
            answer.append(s[i])
        }

        for i in firstSetCount..<s.count {
            if (i-firstSetCount) % k == 0, i != 0 {
                answer.append("-")
            }
            answer.append(s[i])
        }
        return answer
    }

    // 참고 한 풀이 2
    func licenseKeyFormatting_3(_ s: String, _ k: Int) -> String {
        var answer = String()
        var index = s.count-1
        var count = 0
        let s = Array(s.uppercased())

        while index >= 0 {
            if s[index] == "-" {
                index -= 1
                continue
            }
            if count == k {
                answer.append("-")
                count = 0
            } else {
                answer.append(s[index])
                count += 1
                index -= 1
            }
        }
        return String(answer.reversed())
    }
}
