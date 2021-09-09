//
//  TreePathSum.swift
//  SwiftAlgorithms
//
//  Created by priders on 2021/9/9.
//

import Foundation
class TreePathSumManager {
    
    class func start(){
        
        let arr = [5,4,8,11,nil,13,4,7,2,nil,nil,nil,1]
        
        let rootNode = TreeNode.initializerRootNodeBy(initializerArray: arr)
        let result = TreePathSumManager().hasPathSum(rootNode, 22)
        print(result)
    }
    
    func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
        if root == nil { return false }
        
        var virtualQueue = [(TreeNode,Int)]()
        virtualQueue.append((root!,root!.val))
        while !virtualQueue.isEmpty {
            let node = virtualQueue.first!.0
            let value = virtualQueue.first!.1
            virtualQueue.removeFirst()
            if node.left == nil && node.right == nil {
                if value  == targetSum {
                    return true
                }
            }
            if node.left != nil {
                virtualQueue.append((node.left!,value + node.left!.val))
            }
            if node.right != nil {
                virtualQueue.append((node.right!,value + node.right!.val))
            }
        }
        
        return false
    }
    
    func minDepth_BFS(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        var virtualQueue = [(TreeNode,Int)]()
        virtualQueue.append((root!,1))
        while !virtualQueue.isEmpty {
            let node = virtualQueue.first!.0
            let depth = virtualQueue.first!.1
            virtualQueue.removeFirst()
            if node.left == nil && node.right == nil {
                return depth
            }
            if node.left != nil {
                virtualQueue.append((node.left!,depth + 1))
            }
            if node.right != nil {
                virtualQueue.append((node.right!,depth + 1))
            }
        }
        return 0
    }
}
