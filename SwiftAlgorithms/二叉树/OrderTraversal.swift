//
//  InorderTraversal.swift
//  SwiftAlgorithms
//
//  Created by priders on 2021/9/8.
//

import Foundation
class OrderTraversalManager {
    // 二叉树的遍历
    /**
     * Definition for a binary tree node.
     * public class TreeNode {
     *     public var val: Int
     *     public var left: TreeNode?
     *     public var right: TreeNode?
     *     public init() { self.val = 0; self.left = nil; self.right = nil; }
     *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
     *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
     *         self.val = val
     *         self.left = left
     *         self.right = right
     *     }
     * }
     */
    //https://leetcode-cn.com/problems/binary-tree-inorder-traversal/
    static func start(){
        let initializerArray = [1,nil,2,3]
        let testNode = TreeNode.initializerRootNodeBy(initializerArray: initializerArray)
        let result = OrderTraversalManager.inorderTraversal(testNode)
        print(result)
        
        let resultPreorder = OrderTraversalManager.preorderTraversal(testNode)
        print(resultPreorder)
        
        let resultPostorder = OrderTraversalManager.postorderTraversal(testNode)
        SALogging(resultPostorder)

    }
    
    //通过  0 ms    13.7 MB    Swift
    static func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var result = [Int]()
        
        result = inorderTraversal(root.left)
        
        result.append(root.val)
        
        let right = inorderTraversal(root.right)
        result+=right
        
        return result
    }
    
    static func preorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var result = [root.val]
        result+=preorderTraversal(root.left)
        result+=preorderTraversal(root.right)
        return result
    }
    
    static func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else {
            return []
        }
        var result = postorderTraversal(root.left)
        result+=postorderTraversal(root.right)
        result+=[root.val]
        return result
    }
    
}
