class Solution {
    func licenseKeyFormatting(_ s: String, _ k: Int) -> String {
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
}
