//
//  TreeMaxDepth.swift
//  SwiftAlgorithms
//
//  Created by priders on 2021/9/9.
//

import Foundation
class TreeMaxDepthManager {
    
    class func start(){
        let arr = [3,9,20,nil,nil,15,7]
        let rootNode = TreeNode.initializerRootNodeBy(initializerArray: arr)
        let result = TreeMaxDepthManager().maxDepth_BFS(rootNode)
        print(result)
    }
    
    //通过 28 ms    14.3 MB    Swift
    func maxDepth_DFS(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        let leftWithRightMax = max( maxDepth_DFS(root?.left), maxDepth_DFS(root?.right))
        return leftWithRightMax + 1
    }
    
    //通过 32 ms    14.1 MB
    func maxDepth_BFS(_ root: TreeNode?) -> Int {
        
        if root == nil { return 0 }
        
        var virtualQueue = [TreeNode]()
        virtualQueue.append(root!)
        var result = 0
        
        while !virtualQueue.isEmpty {
            
            var size = virtualQueue.count
            while size > 0 {
                let node = virtualQueue.first!
                virtualQueue.removeFirst()
                if node.left != nil {
                    virtualQueue.append(node.left!)
                }
                if node.right != nil {
                    virtualQueue.append(node.right!)
                }
                size-=1
            }
            result+=1
        }
        return result
    }

}
