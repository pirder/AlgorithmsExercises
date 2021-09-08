//
//  Sort_Intersection.swift
//  SwiftAlgorithms
//
//  Created by priders on 2021/9/7.
//

import Foundation
class Sort_Intersection {
    //349. 两个数组的交集
    //1 双集合法
    //2 双指针法
    //    24 ms    13.8 MB    Swift
    static func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var num1Set = Set<Int>()
        var result = Set<Int>()
        nums1.forEach { (num) in
            num1Set.insert(num)
        }
        nums2.forEach { (num) in
            if num1Set.contains(num) {
                result.insert(num)
            }
        }
        return result.map({$0})
    }
    
    //350. 两个数组的交集 II
    //注意点 ：输出结果中每个元素出现的次数，应与元素在两个数组中出现次数的最小值一致。
    //过 20 ms    13.9 MB    Swift
    static func intersection_II(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var num1Dict = Dictionary<Int,Int>()
        var result = [Int]()
        let numsCountRelation = nums1.count < nums2.count
        (numsCountRelation ? nums1 : nums2).forEach { (num) in
            if num1Dict.keys.contains(num) {
                num1Dict[num]!+=1
            }else{
                num1Dict[num]=1
            }
        }
        (numsCountRelation ? nums2 : nums1).forEach { (num) in
            if num1Dict.keys.contains(num){
                if num1Dict[num]! > 0 {
                    num1Dict[num]!-=1
                    result.append(num)
                }
            }
        }
        return result
    }
    
}
