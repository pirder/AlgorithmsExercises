//
//  FindTheDifference.swift
//  SwiftAlgorithms
//
//  Created by priders on 2021/9/8.
//

import Foundation

class FindTheDifference {
    
    //过  8 ms    14 MB    Swift
    //计算ascII码总数 相减
    static func FindTheDifference_ASCII(_ s: String, _ t: String) -> Character{
        var sumS:Int = 0
        s.forEach { (char) in
            sumS+=Int(char.asciiValue ?? 0)
        }
        var sumT:Int = 0
        t.forEach { (char) in
            sumT+=Int(char.asciiValue ?? 0)
        }
        
        
        return Character.init(
            Unicode.Scalar.init(UInt8(
                                    abs(Int32(sumS - sumT)))))
    }
}
