//
//  ContainsDuplicate.swift
//  SwiftAlgorithms
//
//  Created by priders on 2021/9/7.
//

import Foundation

class ContainsDuplicateSolution {
    //https://leetcode-cn.com/problems/contains-duplicate/
    
    //通过 136 ms    16.4 MB    Swift
    static func containsDuplicate_Hash(_ nums: [Int]) -> Bool {
        var setManager = Set<Int>()
        for num in nums {
            if setManager.contains(num) {
                return true
            }
            setManager.insert(num)
        }
        return false
    }
    //通过 144 ms    15.3 MB    Swift
    static func containsDuplicate_Sort(_ nums: [Int]) -> Bool {
        let arr = nums.sorted()
        for i in 0..<arr.count-1 {
            if arr[i] == arr[i+1] {
                return true
            }
        }
        return false
    }
    
}


