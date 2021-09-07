//
//  MissNumbers.swift
//  SwiftAlgorithms
//
//  Created by priders on 2021/9/7.
//

import Foundation
class MissNumbers {
    //1。排序 三种情况 0 末尾 中间 中间1...n-1
    //2。哈希表 0-n插入 之后遍历缺那个就是哪个
    //3。数学计算 全部都有的总和减去 缺少某一个的总和 得到的数就是结果
    //4。位运算
    
    //通过 152 ms    13.9 MB    Swift
    static  func missingNumber(_ nums: [Int]) -> Int {
        let expectedSum = nums.count *  (nums.count + 1) / 2
        var sum = 0
        nums.forEach { (num) in
            sum+=num
        }
        return expectedSum - sum;
    }
}
