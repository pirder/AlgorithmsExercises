//
//  TreeisBalanced.swift
//  SwiftAlgorithms
//
//  Created by priders on 2021/9/9.
//

import Foundation
class TreeIsBalancedManager {
    
    class func start(){
        let arr =  [3,9,20,nil,nil,15,7]//[1,2,2,3,3,nil,nil,4,4]
        let rootNode = TreeNode.initializerRootNodeBy(initializerArray: arr)
        let result = TreeIsBalancedManager().isBalanced(rootNode)
        print(result)
    }
    
    //过 44 ms    14.9 MB    Swift
    private func isBalanced(_ root: TreeNode?) -> Bool {
        
        if root == nil { return true }
        
        let leftDepth = maxDepth_DFS(root?.left)
        let rightDepth = maxDepth_DFS(root?.right)
        let dValue = abs(leftDepth - rightDepth)
        if dValue > 1 {
            return false
        }
        return isBalanced(root?.left) && isBalanced(root?.right)
        
    }
    
    func maxDepth_DFS(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        let leftWithRightMax = max( maxDepth_DFS(root?.left), maxDepth_DFS(root?.right))
        return leftWithRightMax + 1
    }

}
