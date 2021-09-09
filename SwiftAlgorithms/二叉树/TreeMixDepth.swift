//
//  TreeMixDepth.swift
//  SwiftAlgorithms
//
//  Created by priders on 2021/9/9.
//

import Foundation
class TreeMixDepthManager {
    
    class func start(){
        
        let arr = [2,nil,3,nil,4,nil,5,nil,6]//[3,9,20,nil,nil,15,7]
        let rootNode = TreeNode.initializerRootNodeBy(initializerArray: arr)
        let result = TreeMixDepthManager().minDepth_DFS(rootNode)
        print(result)
    }
    
    //如果没有 左右子数 0 这种情况 特殊处理 min会一直当他是0最小 跟最大深度最大区别
    //通过 944 ms    26.5 MB    Swift
    func minDepth_DFS(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        
        let minDepthleft = minDepth_DFS(root?.left)
        let minDepthRight = minDepth_DFS(root?.right)
        /* 方法一
        var minDepth = min(minDepthleft, minDepthRight)
        if minDepthleft == 0 {
            minDepth = minDepthRight
        }
        if minDepthRight == 0 {
            minDepth = minDepthleft
        }
         */
        //方法二
        let minDepth = min(minDepthleft == 0 ? minDepthRight : minDepthleft,
                           minDepthRight == 0 ? minDepthleft : minDepthRight)

        
        return minDepth + 1
    }
    
    //最小最大深度  广度优先的区别 在于 每层 节点都可能是最小的这种情况 但是最大深度的话 肯定是最后一层为最深
    //通过 892 ms    25 MB    Swift
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
