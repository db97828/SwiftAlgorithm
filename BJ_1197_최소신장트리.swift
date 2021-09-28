//
//  BJ_1197_최소신장트리.swift
//  Algorithm
//
//  Created by dabeen on 2021/09/23.
//

/*
 [신장트리]
 : 모든 노드가 연결되어 있으며, 사인클이 발생하지 않는 그래프
 
 [최소 신장 트리]
 : MST(Minimum Spanning Tree), 간선 가중치의 합이 최소인 신장 트리
 
 [크루스칼 알고리즘으로 최소 신장 트리 찾는 방법]
 1. 그래프 간선의 가중치를 오름차순으로 정렬
 2. 첫 번째 간선부터 차례대로 검사해서 사이클이 생기지 않으면 선택
 3. 선택 된 간선의 갯수가 (노드의 갯수 - 1)이 될 때까지 반복
 
 [유니온 파인드 -> 사이클이 생기는지 판단하기 위해 사용]
 1. 각 노드 별 부모 노드를 저장할 Parent 딕셔너리 생성 후 자기 자신으로 초기화
 2. 각 노드 별 깊이를 저장할 Rank 딕셔너리 생성 후 0으로 초기화
 3. 둘의 Root Node값을 찾고(find) 값이 다른 경우 합치는(union) 과정 진행
 4. union작업
 -> Rank 딕셔너리의 값을 비교해서 작은 쪽의 Parent값을 큰 쪽 Parent값으로 바꿈
 -> Rank 값이 같은 경우 아무쪽이나 해도됨 but 바뀌지 않은 쪽 Rank 값을 +1
 
 참고 : [https://babbab2.tistory.com/111?category=908012]
 */

import Foundation

func 최소신장트리_개념정리() {
    let vertices = ["A","B","C","D"]
    let edges = [
        (5,  "A", "B"),
        (1,  "A", "C"),
        (10, "A", "D"),
        (5,  "B", "A"),
        (3,  "B", "D"),
        (1,  "C", "A"),
        (8,  "C", "D"),
        (10, "D", "A"),
        (3,  "D", "B"),
        (8,  "D", "C"),
    ]

    typealias edge = (Int, String, String)

    func kruskal(_ vertices:[String], _ edges:[edge]) -> [edge] {
        var mst = [edge]()
        var edges = edges.sorted{ $0.0 < $1.0 }

        var rank = [String:Int]()
        var parent = [String:String]()

        for vertex in vertices {
            rank.updateValue(0, forKey: vertex)
            parent.updateValue(vertex, forKey: vertex)
        }

        func find(_ node:String) -> String {
            if node != parent[node]! {
                parent[node] = find(parent[node]!)
            }
            return parent[node]!
        }

        func union(_ node1:String, _ node2:String) {
            let rank1 = find(node1)
            let rank2 = find(node2)

            if rank[rank1]! > rank[rank2]! {
                parent[rank2] = rank1
            } else {
                parent[rank1] = rank2
                if rank[rank1]! == rank[rank2]! {
                    rank[rank2]! += 1
                }
            }
        }

        while mst.count < vertices.count-1 {
            let node = edges.removeFirst()
            if find(node.1) != find(node.2) {
                union(node.1, node.2)
                mst.append(node)
            }
        }
        return mst
    }
}

/*
 첫째 줄에 정점의 개수 V(1 ≤ V ≤ 10,000)와 간선의 개수 E(1 ≤ E ≤ 100,000)가 주어진다.
 다음 E개의 줄에는 각 간선에 대한 정보를 나타내는 세 정수 A, B, C가 주어진다.
 이는 A번 정점과 B번 정점이 가중치 C인 간선으로 연결되어 있다는 의미이다.
 C는 음수일 수도 있으며, 절댓값이 1,000,000을 넘지 않는다.

 그래프의 정점은 1번부터 V번까지 번호가 매겨져 있고,
 임의의 두 정점 사이에 경로가 있다.
 최소 스패닝 트리의 가중치가 -2,147,483,648보다 크거나 같고, 2,147,483,647보다 작거나 같은 데이터만 입력으로 주어진다.
 
 예제 입력 1
 3 3
 1 2 1
 2 3 2
 1 3 3
 
 예제 출력 1
 3
 */

func solution1197_최소신장트리_1() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let v = input[0]        //꼭짓점갯수
    let e = input[1]        //간선정보
    
    var parent = Array(0...v)
    var graph = [[Int]]()
    var lines = 0
    var result = 0
    
    for _ in 0..<e {
        graph.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }
    
    graph.sort{ (a,b) -> Bool in
        return a[2] < b[2]
    }
    
    for index in 0..<graph.count {
        if lines == v - 1 {
            break
        }
        if findParent(graph[index][0]) != findParent(graph[index][1]) {
            result += graph[index][2]
            lines += 1
            unionParent(graph[index][0], graph[index][1])
        }
    }
    
    print(result)
    
    func findParent(_ index:Int) -> Int {
        if parent[index] != index { parent[index] = findParent(parent[index]) }
        return parent[index]
    }
    
    func unionParent(_ a:Int, _ b:Int) {
        let num1 = findParent(a)
        let num2 = findParent(b)
        if a < b { parent[num2] = num1 }
        else { parent[num1] = num2 }
    }
}
