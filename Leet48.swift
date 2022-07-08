//
//  48.swift
//  Algorithm
//
//  Created by dabeen on 2022/07/08.
//

import Foundation

class Solution_48 {
    func rotate_1(_ matrix: inout [[Int]]) {
        let copiedMatrix = matrix
    
        for i in 0..<copiedMatrix.count {
            for j in 0..<copiedMatrix[i].count {
                matrix[i][j] = copiedMatrix[copiedMatrix.count-1-j][i]
            }
        }
    }
    
    func rotate_2(matrix: inout [[Int]]) {
        var rotatedMatrix = Array(repeating: Array(repeating: 0, count: matrix.count), count: matrix.count)
        let max = matrix.count-1
        
        for (i, row) in matrix.enumerated() {
            for (j, value) in row.enumerated() {
                rotatedMatrix[j][max-i] = value
            }
        }
        
        matrix = rotatedMatrix
    }
    
    func rotate_3_공부용(_ matrix: inout [[Int]]) {
        let count = matrix.count
        for i in  0..<count/2 {
            for j in 0..<(count+1)/2 {
                let tmp = matrix[i][j]
                matrix[i][j] = matrix[count-j-1][i]
                matrix[count-j-1][i] = matrix[count-i-1][count-j-1]
                matrix[count-i-1][count-j-1] = matrix[j][count-i-1]
                matrix[j][count-i-1] = tmp
            }
        }
    }
}
