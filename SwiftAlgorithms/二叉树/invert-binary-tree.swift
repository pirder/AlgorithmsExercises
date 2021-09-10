//
//  invert-binary-tree.swift
//  SwiftAlgorithms
//
//  Created by priders on 2021/9/10.
//

import Foundation

class InvertBinaryTreeManager {
    //https://leetcode-cn.com/problems/invert-binary-tree/
    class func start(){
        
        let arr = [4,2,7,1,3,6,9]

        let rootNode = TreeNode.initializerRootNodeBy(initializerArray: arr)
        TreeNode.printStructionAboutTreeGraph(rootNode)
        let result = InvertBinaryTreeManager().invertTree_DFS(rootNode)
        TreeNode.printStructionAboutTreeGraph(result)
    }
    // 4 ms    13.5 MB
    func invertTree_DFS(_ root: TreeNode?) -> TreeNode? {
        if root?.left != nil || root?.right != nil {
            let tempNode = invertTree_DFS(root?.left)
            root?.left = invertTree_DFS(root?.right)
            root?.right = tempNode
        }
        return root
    }

    //通过 4 ms    13.4 MB    
    func invertTree_BFS(_ root: TreeNode?) -> TreeNode? {
        if root == nil || (root?.left == nil && root?.right == nil) {
            return root
        }
        
        var virtualQueue = [TreeNode]()
        let rootResult = root
        virtualQueue.append(root!)
        while !virtualQueue.isEmpty {
            let handleRoot = virtualQueue.removeFirst()
            if handleRoot.left != nil || handleRoot.right != nil {
                let tempNode = handleRoot.left
                handleRoot.left = handleRoot.right
                handleRoot.right = tempNode
                if let left = handleRoot.left {
                    virtualQueue.append(left)
                }
                if let right = handleRoot.right {
                    virtualQueue.append(right)
                }
            }
        }
        return rootResult
        
    }

    
}
