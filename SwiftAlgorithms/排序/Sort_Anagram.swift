//
//  Sort_Anagram.swift
//  SwiftAlgorithms
//
//  Created by priders on 2021/9/7.
//

import Foundation
class Sort_Anagram {
    //有效的字母异位词
    
    typealias CountKey = Int
    //通过 92 ms    14.1 MB
    static func isAnagram_Hash_my(_ s: String, _ t: String) -> Bool {
        if s.count != t.count {
            return false
        }
        var hashMapDict = [Character:CountKey]()
        for item in s {
            if !hashMapDict.keys.contains(item) {
                hashMapDict[item] = 1
            }else{
                hashMapDict[item]!+=1
            }
        }
        for item in t {
            if hashMapDict.keys.contains(item) {
                hashMapDict[item]!-=1
                if hashMapDict[item]! <= 0 {
                    hashMapDict.removeValue(forKey: item)
                }
            }else{
                return false
            }
        }
        return true
    }
    
    //通过  260 ms    15.7 MB
    static func isAnagram_Sort(_ s: String, _ t: String) -> Bool {
        if s.count != t.count {
            return false
        }
        let first = s.sorted()
        let second = t.sorted()
        if first != second {
            return false
        }
        return true
        
    }
}
