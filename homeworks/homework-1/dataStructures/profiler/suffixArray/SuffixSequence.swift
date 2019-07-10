//
//  SuffixSequence.swift
//  homework-1
//
//  Created by michael on 02/07/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation


struct SuffixSequence: Sequence {
    let string:String
    
    func makeIterator() -> SuffixIterator {
        return SuffixIterator(string: string)
    }
}


struct SuffixIterator: IteratorProtocol {
    
    let string:String
    let last: String.Index
    var offset: String.Index
    
    init(string: String) {
        self.string = string
        self.last = string.endIndex
        self.offset = string.startIndex
    }
    
    mutating func next() -> Substring? {
        guard offset < last else {
            return nil
        }
        let sub: Substring = string[offset..<last]
        string.formIndex(after: &offset)
        return sub
    }
}
