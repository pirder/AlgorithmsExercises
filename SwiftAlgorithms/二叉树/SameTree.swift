//
//  SameTree.swift
//  SwiftAlgorithms
//
//  Created by priders on 2021/9/8.
//

import Foundation
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
class SameTree {
    //https://leetcode-cn.com/problems/same-tree/
    static func start(){
        let pArr = [1,2,3], qArr = [1,2,3]
        let p = TreeNode.initializerRootNodeBy(initializerArray: pArr)
        let q = TreeNode.initializerRootNodeBy(initializerArray: qArr)
        let result = SameTree().isSameTree(p, q)
        print(result)
    }
    
    //大概的想法就是 按照同一个遍历方式
    private func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        //比对规则 === 》递归
        if p == nil && q == nil { //对root进行判断
            return true
        } else if p == nil || q == nil  { //如果仅有一个 是空 那就是不相同
            return false
        } else if p!.val != q!.val { //两个值不相同
            return false
        } else { //root 是符合的 接着按照这个规则去递归 左右  有一个不对应 就是不同
            return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
        }
    }
}
