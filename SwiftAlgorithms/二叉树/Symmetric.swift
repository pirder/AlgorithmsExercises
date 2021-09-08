//
//  Symmetric.swift
//  SwiftAlgorithms
//
//  Created by priders on 2021/9/8.
//

import Foundation
class Symmetric {
    //https://leetcode-cn.com/problems/symmetric-tree/
    static func start(){
        let root = [1,2,2,nil,3,nil,3] //[1,2,2,3,4,4,3] 
        let cinValue = TreeNode.initializerRootNodeBy(initializerArray: root)
        let result = Symmetric().isSymmetric(cinValue)
        print(result)
    }
    //通过 12 ms    13.9 MB    Swift
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return readLeftAndRight(root,root)
    }
    
    func readLeftAndRight(_ left: TreeNode?, _ rignt: TreeNode?) -> Bool {
        if left == nil && rignt == nil {
            return true
        }
        if left == nil || rignt == nil{
            return false
        }
        //满足条件 值相等 左右都相等 双指针 解决的根本
        return left!.val == rignt!.val &&
            readLeftAndRight(left!.left, rignt!.right) &&
            readLeftAndRight(left!.right, rignt!.left)
    }
    
}
