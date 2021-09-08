//
//  TreeNode.swift
//  SwiftAlgorithms
//
//  Created by priders on 2021/9/8.
//

import Foundation

public class TreeNode {
    
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil}
    public init(_ val:Int) { self.val = val; self.left = nil; self.right = nil}
    public init(_ val:Int, _ left:TreeNode?, _ right:TreeNode?){
        self.val = val
        self.left = left
        self.right = right
    }
    
    class func initializerRootNodeBy(initializerArray arr:[Int?]) ->TreeNode? {
        guard !arr.isEmpty && arr.first != nil else {
            return nil
        }
        let rootResult = TreeNode.init(arr[0]!, nil, nil)
        
        if arr.count <= 3 {
            rootResult.left = initTreeNodeBy(element: arr[1])
            rootResult.right = initTreeNodeBy(element: arr[2])
            return rootResult
        }
        
        var root = rootResult
        var index = 1
        for _ in 1..<arr.count {
            if index > arr.count-1 || index+1 > arr.count-1 {
                if index == arr.count-1{
                    root.left = initTreeNodeBy(element: arr[index])
                }
                break
            }
            root.left = initTreeNodeBy(element: arr[index])
            root.right = initTreeNodeBy(element: arr[index+1])
            if let left = root.left {
                root = left
            }else if let right = root.right {
                root = right
            }
            index+=2
        }
        return rootResult
    }
    
    private class func initTreeNodeBy(element value:Int?) ->TreeNode? {
        guard let rootVal = value else {
            return nil
        }
        return TreeNode.init(rootVal)
    }
    
}
