public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

// 처음 푼 방법
func countNodes(_ root: TreeNode?) -> Int {
    return root == nil ? 0 : countNodes(root?.right) + countNodes(root?.left) + 1
}

//guard문 사용
func countNodes(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    return countNodes(root.right) + countNodes(root.left) + 1
}
