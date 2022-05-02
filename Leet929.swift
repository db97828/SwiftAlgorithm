import Foundation

//print(numUniqueEmails(["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]))
//print(numUniqueEmails(["a@leetcode.com","b@leetcode.com","c@leetcode.com"]))
//print(numUniqueEmails(["test.email+alex@leetcode.com","test.email.leet+alex@code.com"]))
class Solution {
    func numUniqueEmails(_ emails: [String]) -> Int {
        var answer: Set<String> = []
        
        emails.forEach { email in
            let email = email.components(separatedBy: "@")
            let prefix = email[0].replacingOccurrences(of: ".", with: "").components(separatedBy: "+")[0]
            answer.insert(prefix+"@"+email[1])
        }
        return answer.count
    }
}


/*
 Condition:
 1. If you add periods '.' between some characters in the local name part of an email address,
 mail sent there will be forwarded to the same address without dots in the local name.
 Note that this rule does not apply to domain names.
 
 2. If you add a plus '+' in the local name, everything after the first plus sign will be ignored.
 This allows certain emails to be filtered.
 Note that this rule does not apply to domain names.
 
 
 Input: emails = ["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]
 Output: 2
 Explanation: "testemail@leetcode.com" and "testemail@lee.tcode.com" actually receive mails.
 
 Input: emails = ["a@leetcode.com","b@leetcode.com","c@leetcode.com"]
 Output: 3
 
 Constraints:
 1 <= emails.length <= 100
 1 <= emails[i].length <= 100
 emails[i] consist of lowercase English letters, '+', '.' and '@'.
 Each emails[i] contains exactly one '@' character.
 All local and domain names are non-empty.
 Local names do not start with a '+' character.
 Domain names end with the ".com" suffix.
 */
