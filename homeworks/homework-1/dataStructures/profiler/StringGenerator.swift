//
//  StringGenerator.swift
//  DataStructures
//
//  Created by Ellen Shapiro on 8/2/14.
//  Copyright (c) 2014 Ray Wenderlich Tutorial Team. All rights reserved.
//

import Foundation

open class StringGenerator {
    fileprivate let alphaCharacterString: String = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ "
    
    open func generateRandomString(_ length: Int) -> String {
        var randomString = String()
        for _ in 0 ..< length {
            let elements = UInt32(alphaCharacterString.count)
            let randomIndex = Int(arc4random_uniform(elements))
            randomString += String(Array(alphaCharacterString)[randomIndex])
        }
        
        return randomString
    }
    
    open func standardRandomString() -> String {
        return generateRandomString(12)
    }
    
    open func randomSingleCharacterString() -> String {
        return generateRandomString(1)
    }
}
