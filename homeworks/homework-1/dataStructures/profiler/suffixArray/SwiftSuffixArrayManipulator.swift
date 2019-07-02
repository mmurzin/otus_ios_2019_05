//
//  SwiftSuffixArrayManipulator.swift
//  homework-1
//
//  Created by michael on 01/07/2019.
//  Copyright © 2019 Mikhail Murzin. All rights reserved.
//

import Foundation

class SwiftSuffixArrayManipulator: SuffixArrayManipulator {
    
    var algoSuffixArrays:[(suffix: String, algoName: String)] = []
    var randomSuffixArrays:[(suffix: String, algoName: String)] = []
    
    func arrayHasObjects() -> Bool {
        if randomSuffixArrays.count == 0 {
            return false
        } else {
            return true
        }
    }
    
    func setupWithSize(_ size: Int) -> TimeInterval {
        return Profiler.runClosureForTime() {
            self.randomSuffixArrays = self.createSuffixArray(self.randomizeWords(size: size, wordSize: 14))
        }
    }
    
    func setupWithObjects(_ items: [String]) -> TimeInterval {
        let time = Profiler.runClosureForTime() {
            self.algoSuffixArrays = self.createSuffixArray(items)
        }
        print("creation \(time)")
        return time
    }
    
    func searchRandomWords(count: Int, wordSize: Int) -> TimeInterval {
        let time =  Profiler.runClosureForTime() {
            let words = self.randomizeWords(size: count, wordSize: wordSize)
            for word in words {
                let result = self.search(query: word, suffixArray: self.algoSuffixArrays)
                print(result)
            }
        }
        print("search \(time)")
        return time
    }
    
    private func randomizeWords(size: Int, wordSize: Int) -> [String] {
        var words: [String] =  []
        var value = 0
        let stringGenerator = StringGenerator()
        while value < size {
            words.append(stringGenerator.generateRandomString(wordSize))
            value += 1
        }
        return words
    }
    
    private func createSuffixArray(_ items: [String]) -> [(suffix: String, algoName: String)] {
        var suffixArray:[(suffix: String, algoName: String)] = []
        for word in items {
            for suffix in SuffixSequence(string: word) {
                suffixArray
                    .append((suffix: String(suffix), algoName: word))
            }
        }
        suffixArray.sort {
            $0.suffix < $1.suffix
        }
        return suffixArray
    }
    
    func search(query: String, suffixArray: [(suffix: String, algoName: String)]) -> [String] {
        var result = Set<String>()
        let queryPrefix = query.prefix(1)
        var isPrefixGroupFounded = false
        for item in suffixArray {
            if(queryPrefix == item.suffix.prefix(1)){
                isPrefixGroupFounded = true
            }
            
            if(isPrefixGroupFounded && queryPrefix != item.suffix.prefix(1)) {
                break
            }
            
            if(item.suffix == query) {
                result.insert(item.algoName)
            }
        }
        return Array(result)
    }
}


