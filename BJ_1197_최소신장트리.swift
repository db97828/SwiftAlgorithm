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

//let vertices = ["A","B","C","D"]
//let edges = [
//    (5,  "A", "B"),
//    (1,  "A", "C"),
//    (10, "A", "D"),
//    (5,  "B", "A"),
//    (3,  "B", "D"),
//    (1,  "C", "A"),
//    (8,  "C", "D"),
//    (10, "D", "A"),
//    (3,  "D", "B"),
//    (8,  "D", "C"),
//]
//
//typealias edge = (Int, String, String)
//
//
//func kruskal(_ vertices:[String], _ edges:[edge]) -> [edge] {
//    var mst = [edge]()
//    var edges = edges.sorted{ $0.0 < $1.0 }
//
//    var rank = [String:Int]()
//    var parent = [String:String]()
//
//    for vertex in vertices {
//        rank.updateValue(0, forKey: vertex)
//        parent.updateValue(vertex, forKey: vertex)
//    }
//
//    func find(_ node:String) -> String {
//        if node != parent[node]! {
//            parent[node] = find(parent[node]!)
//        }
//        return parent[node]!
//    }
//
//    func union(_ node1:String, _ node2:String) {
//        let rank1 = find(node1)
//        let rank2 = find(node2)
//
//        if rank[rank1]! > rank[rank2]! {
//            parent[rank2] = rank1
//        } else {
//            parent[rank1] = rank2
//            if rank[rank1]! == rank[rank2]! {
//                rank[rank2]! += 1
//            }
//        }
//    }
//
//    while mst.count < vertices.count-1 {
//        let node = edges.removeFirst()
//        if find(node.1) != find(node.2) {
//            union(node.1, node.2)
//            mst.append(node)
//        }
//    }
//    return mst
//}
//
