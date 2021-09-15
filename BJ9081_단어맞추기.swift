//
//  BJ9081_단어맞추기.swift
//  Algorithm
//
//  Created by dabeen on 2021/09/15.
//

import Foundation

//시간초과
func solution9081_단어_맞추기_1() {
    let n = Int(readLine()!)!
    var wordArr = [String]()

    for _ in 0..<n {
        let word = readLine()!.map{String($0)}
        var visited = [Bool](repeating: false, count: word.count)
        wordArr = []
        getPermutation(0, word, "", &visited)
        wordArr = wordArr.sorted()
        if let index = wordArr.firstIndex(of: word.joined()) {
            if index == wordArr.count-1 { print(wordArr.last!) }
            else{ print(wordArr[index+1]) }
        }
    }

    func getPermutation(_ current:Int, _ word:[String], _ temp:String, _ visited:inout [Bool]) {
        if current == word.count {
            if !wordArr.contains(temp) {
                wordArr.append(temp)
                return
            }
        }
        else {
            for i in 0..<word.count {
                var temp = temp
                if !visited[i] {
                    visited[i] = true
                    temp += word[i]
                    getPermutation(current+1, word, temp, &visited)
                    visited[i] = false
                }
            }
        }
    }

}

/*
 참고 : [https://imgoood.tistory.com/86]
 참고 : [https://jins-dev.tistory.com/entry/%EB%8B%A4%EC%9D%8C-%EC%88%9C%EC%97%B4-%EC%B0%BE%EA%B8%B0-%EC%A0%84%EC%B2%B4-%EC%88%9C%EC%97%B4-%ED%83%90%EC%83%89-%EC%95%8C%EA%B3%A0%EB%A6%AC%EC%A6%98-Next-Permutation]
 next_permutation 알고리즘 사용
 : 순열 및 조합을 생성할 때 재귀적으로 구현하지 않고,
 각 인덱스 값을 비교하여 모든 경우의 인덱스 값을 뽑아내는 방법
 
 : 현 순열에서 사전 순(오름차순)으로 다음 순열 생성
  -> 가장 작은 값으로 정렬한 뒤, 한 자리씩 swap하면서 출력
 */
func solution9081_단어_맞추기_2() {
    let n = Int(readLine()!)!
    
    for _ in 0..<n {
        var word = readLine()!.map{String($0)}
        if nextPermutation(&word) {print(word.joined())}
        else{ print(word.joined()) }
    }
    
    func nextPermutation(_ word:inout [String]) -> Bool{
        var i = word.count - 1
        while i > 0 && word[i-1] >= word[i] { i -= 1 }
        if i == 0 { return false}
            
        var j = word.count - 1
        while word[i-1] >= word[j] { j -= 1 }
            
        var temp = word[i-1]
        word[i-1] = word[j]
        word[j] = temp
        
        word = word[..<i] + word[i...].reversed()
        //reversed를 직접 구현하는게 더 빠름(아주조금)
//        var k = word.count-1
//        while i < k {
//            temp = word[i]
//            word[i] = word[k]
//            word[k] = temp
//            i += 1
//            k -= 1
//        }
        
        return true
    }
}
