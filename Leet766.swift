func isToeplitzMatrix_1(_ matrix: [[Int]]) -> Bool {
    let m = matrix.count
    let n = matrix[0].count

    for i in 1..<n {
        for j in 1..<m {
            if matrix[j][i] != matrix[j-1][i-1] { return false }
        }
    }


    return true
}

func isToeplitzMatrix_2(_ matrix: [[Int]]) -> Bool {
    for i in 1..<matrix.count {
        guard matrix[i-1].dropLast() == matrix[i].dropFirst() else { return false }
    }
    return true
}
