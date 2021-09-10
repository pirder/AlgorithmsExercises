//
//  ThirdMax_Sort.swift
//  SwiftAlgorithms
//
//  Created by priders on 2021/9/8.
//

import Foundation
class  ThirdMax_Sort {
    //通过 40 ms    13.9 MB    Swift
    //最小值 
    static func thirdMax(_ nums: [Int]) -> Int {
        
        var maxNumber = Int.min
        var secondMax = Int.min
        var thirdMax = Int.min
        nums.forEach { (num) in
            var temp = num
            if temp > maxNumber {
                temp = maxNumber
                maxNumber = num
            }
            if temp > secondMax && temp != maxNumber {
                let before = temp
                temp = secondMax
                secondMax = before
            }
            if temp > thirdMax && temp != maxNumber && temp != secondMax {
                thirdMax = temp
            }
        }
        return thirdMax == Int.min ? maxNumber : thirdMax
    }
    
}
