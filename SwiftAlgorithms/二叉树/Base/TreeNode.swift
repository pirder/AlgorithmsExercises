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
        //保存当前的左右节点
        var virtualQueue = [TreeNode]()
        var root = rootResult
        var index = 1
        for _ in 1..<arr.count {
            if index > arr.count-1 || index+1 > arr.count-1 {
                if index == arr.count-1{
                    root.left = initTreeNodeBy(element: arr[index])
                }
                break
            }
            if !virtualQueue.isEmpty {
                root = virtualQueue.removeFirst()
            }
            root.left = initTreeNodeBy(element: arr[index])
            root.right = initTreeNodeBy(element: arr[index+1])
            
            if let left = root.left {
                virtualQueue.append(left)
            }
            if let right = root.right {
                virtualQueue.append(right)
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

extension TreeNode {
    
    /// 打印列表
    /// - Parameter tree: tree
    class func printStructionAboutTreeGraph(_ tree: TreeNode?) {
        var index = 0
        //先确定有多少个 深度
        let maxD = maxDepth(tree)
        //获取数组格式的数 显示过程好处理
        var array = transformArrayBy(treeNode: tree)
        print("====打印树的形状结构====\n")
        while true {
            let maxSpacing = 2 * maxD - 1 //7
            let currentScaping = (maxSpacing - index) / (1<<index)
            let temp = array.dropLast((array.count - 1<<index)%(array.count))
            array.removeFirst((1<<index)%(array.count))
            printLineWith(Scaping: currentScaping * 2, Depth: maxD, Array: temp.map({$0}))
            if index == maxD - 1  {
                break
            }
            index+=1
        }
        print("==================================================\n")

    }
    
    ///转换为数组
    class func transformArrayBy(treeNode root: TreeNode?) -> [Int?] {
        var resultArr = [Int?]()
        var virtualQueue = [TreeNode?]()
        if root == nil {
            return []
        }
        virtualQueue.append(root!)
        while !virtualQueue.isEmpty {
           

            let rootTemp = virtualQueue.removeFirst()
            resultArr.append(rootTemp?.val)
            //教训注释===
            do {
            //
            //     原想法 为nil 时候 不能够在进行传值了 叶子结点不用加了 但是对于数组而言在乎这个为nil的值 之前数中不在乎
            //    结果出现后续还有节点 这种情况
//                if rootTemp?.left != nil && rootTemp?.right != nil {
//                virtualQueue.append(rootTemp?.left)
//                virtualQueue.append(rootTemp?.right)
//                }
            };
            virtualQueue.append(rootTemp?.left)
            virtualQueue.append(rootTemp?.right)

            //所以修改为 就算是原子结点 加入了是nil 后续也没有存在的结点 那说明是最后一个叶子结点 剩下的不用处理啦
            if virtualQueue.compactMap({$0}).count == 0 {
                break
            }

        }
        return resultArr
    }
    
    private class func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        let leftWithRightMax = max( maxDepth(root?.left), maxDepth(root?.right))
        return leftWithRightMax + 1
    }
    
    ///打印每行
    private class func printLineWith(Scaping scaping:Int,Depth maxDepth: Int, Array arr:[Int?]) {
        var result = ""
        let addSacping = { (_ count: Int) -> String in
            var str = ""
            for _ in 0..<count {
                str+=" "
            }
            return str
        }
        //第一个
        var scapingStr = addSacping(scaping)
        
        
        for index in 0..<arr.count {
            
            if index != 0 {
                if index % 2 != 0{
                    scapingStr = addSacping( maxDepth * 8 / arr.count )
                } else {
                    scapingStr = addSacping(maxDepth * 8 / arr.count - 2 )
                }
            }
            
            result+=scapingStr
            if let item = arr[index]  {
                result+="\(item)"
            } else {
                result+="X"
            }
        }
        
        print(result)

    }

}

extension TreeNode : Equatable {
    
    public static func == (lhs: TreeNode, rhs: TreeNode) -> Bool {
        return lhs === rhs
    }
    
}
